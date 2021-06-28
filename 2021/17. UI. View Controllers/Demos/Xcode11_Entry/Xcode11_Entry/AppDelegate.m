//
//  AppDelegate.m
//  Xcode11_Entry
//
//  Created by Victor Semenchuk on 3/31/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "AppDelegate.h"
#import "RSViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RSViewController *rootVC = [[RSViewController alloc] init];
    window.rootViewController = rootVC;
    self.window = window;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
