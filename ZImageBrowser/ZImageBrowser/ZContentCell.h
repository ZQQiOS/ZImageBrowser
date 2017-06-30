//
//  ZContentCell.h
//  ZImageBrowser
//
//  Created by crfchina-mac-mini-1000 on 2017/6/28.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZContentModel.h"
typedef void (^clickImageBlock)(NSArray *imageUrlArr,NSInteger currImage);
@interface ZContentCell : UITableViewCell
@property (strong, nonatomic) ZContentModel *model;
@property (nonatomic, strong) clickImageBlock clickImageBlock;//2.声明block

@end
