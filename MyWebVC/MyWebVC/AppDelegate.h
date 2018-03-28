//
//  AppDelegate.h
//  MyWebVC
//
//  Created by macbook on 2018/3/27.
//  Copyright © 2018年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
typedef NS_ENUM(NSInteger , ScreenRotate) {
    ScreenVertical = 0,
    ScreenHorizon ,
    ScreenAllRotate ,
};
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) ScreenRotate screenRotate;

@end

