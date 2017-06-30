//
//  ZContentModel.m
//  ZQQUseSDWebImage
//
//  Created by crfchina-mac-mini-1000 on 2017/6/27.
//  Copyright © 2017年 SH. All rights reserved.
//

#import "ZContentModel.h"

@implementation ZContentModel
- (NSArray *)imageArr{
    if (!_imageArrStr) {
        _imageArrStr = [NSArray array];
    }
    return _imageArrStr;
}

@end
