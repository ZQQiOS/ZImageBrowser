//
//  ZImageShowController.m
//  ZImageBrowser
//
//  Created by crfchina-mac-mini-1000 on 2017/6/30.
//  Copyright © 2017年 SH. All rights reserved.
//

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#import "ZImageShowController.h"
#import "YYWebImage.h"

@interface ZImageShowController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UILabel *currImageLabel;

@property(nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ZImageShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blackColor];

    //添加scrollview
    [self setupScrollView];
    //添加label
    [self setupCurrImageLabel];
}
- (void)setupCurrImageLabel{
    UILabel *currImageLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 10, SCREEN_WIDTH-100, 20)];
    self.currImageLabel = currImageLabel;
    [self.view addSubview:currImageLabel];
    [currImageLabel setTextColor:[UIColor whiteColor]];
    [currImageLabel setTextAlignment:NSTextAlignmentCenter];
    if (self.imageUrlArr.count>1) {
        currImageLabel.text = [NSString stringWithFormat:@"%ld/%lu",(long)self.currImage,(unsigned long)self.imageUrlArr.count];
        
    }else{
        currImageLabel.text = @"";
        
    }
}
- (void)setupScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    
    //scrollView添加imageView
    NSMutableArray *arrImage = [NSMutableArray array];
    for (int i = 0; i< self.imageUrlArr.count; i++) {
        //创建imageview

        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
        [imageView setYy_imageURL:[NSURL URLWithString:self.imageUrlArr[i]]];
        //图片填充方式
        imageView.contentMode = UIViewContentModeScaleAspectFit;

        [arrImage addObject:imageView];
    }
    
    [arrImage enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 1) 从数组取出imageView
        UIImageView *imageView = obj;
        // 2) 设置图像视图的frame
        [imageView setFrame:CGRectMake(idx * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        // 3) 将图像视图添加到scrollView


        [scrollView addSubview:imageView];
    }];
    
    [scrollView setPagingEnabled:YES];
    [scrollView setBounces:YES];
    [scrollView setContentSize:CGSizeMake(SCREEN_WIDTH*self.imageUrlArr.count, 0)];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];

    [self.scrollView addGestureRecognizer:recognizer];
    
}
#pragma mark - UIScrollView代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 根据scorllView的contentOffset属性，判断当前所在的页数
    NSInteger pageNo = scrollView.contentOffset.x / scrollView.bounds.size.width;
    // 设置页码
    self.currImageLabel.text = [NSString stringWithFormat:@"%ld/%lu",(long)pageNo+1,(unsigned long)self.imageUrlArr.count];
    NSLog(@"%@",self.currImageLabel.text);
}

- (void)touchScrollView{
    [self dismissViewControllerAnimated:NO completion:nil];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchScrollView];
    
}

@end
