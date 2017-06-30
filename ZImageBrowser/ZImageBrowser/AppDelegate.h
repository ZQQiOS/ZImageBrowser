//
//  AppDelegate.h
//  ZImageBrowser
//
//  Created by crfchina-mac-mini-1000 on 2017/6/28.
//  Copyright © 2017年 SH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

