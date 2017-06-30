//
//  ZContentCell.m
//  ZImageBrowser
//
//  Created by crfchina-mac-mini-1000 on 2017/6/28.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZContentCell.h"
#import "UIImageView+setCornerRadius.h"
#import "YYWebImage.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ZContentCell() 
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detaillabel;
@property (weak, nonatomic) IBOutlet UIView *imageArrayView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageArrToDetailBottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageArrViewHeight;

@property (nonatomic, strong) NSArray *imageUrlArr;
@end
@implementation ZContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.iconImageView setImageViewOval];
}

- (void)setModel:(ZContentModel *)model{
    _nameLabel.text = model.nameStr;
    _detaillabel.text = model.introStr;

    //头像
    [_iconImageView setYy_imageURL:[NSURL URLWithString:model.iconImageStr]];

    //图片view
    self.imageUrlArr = model.imageArrStr;
    NSInteger count = self.imageUrlArr.count;
    if (count == 0) {
        //没有图片
        self.imageArrToDetailBottom.constant = 0;
        self.imageArrViewHeight.constant = 1;
     }else{
        self.imageArrToDetailBottom.constant = 8;
        CGFloat imageArrHeight;
        CGFloat magin = 10.0;
        if (count >0 && count <= 3) {
            imageArrHeight = (SCREEN_WIDTH - 16*2 -2*magin)/3;
        }else if (count >3 && count <= 6){
            imageArrHeight = (SCREEN_WIDTH - 16*2 -2*magin)/3*2 + magin;
        }else {
            imageArrHeight = SCREEN_WIDTH - 16*2;
        }
        self.imageArrViewHeight.constant = imageArrHeight;
         
         // 创建imageView；
        for (int i = 0 ;i < count  ;i++){
            UIImageView *imageView = [[UIImageView alloc]init];
            [imageView setYy_imageURL:[NSURL URLWithString:self.imageUrlArr[i]]];
            
            //图片填充方式
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds = YES;
            
            imageView.backgroundColor = [UIColor clearColor];
            imageView.tag = i+1;
            imageView.userInteractionEnabled = YES;

            [self.imageArrayView addSubview:imageView];
            CGFloat w = (SCREEN_WIDTH - 16*2 -2*magin)/3;
            CGFloat h = w;
            CGFloat x = i%3*(w+magin);
            CGFloat y = i/3*(w+magin);
            imageView.frame = CGRectMake(x, y, w, h);
        }

    }
}
- (void)prepareForReuse{
    [super prepareForReuse];
    
    for (UIImageView *view in self.imageArrayView.subviews) {
        [view removeFromSuperview];
    }
}
//点击事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([touch view].tag>0)
    {
        if (self.clickImageBlock) {

            self.clickImageBlock(self.imageUrlArr,[touch view].tag);
        }

    }
}
@end
