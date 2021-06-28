//
//  AppDelegate.m
//  Demo 2
//
//  Created by Viktar Semianchuk on 3/17/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "AppDelegate.h"
#import "RSViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    window.backgroundColor = [UIColor greenColor];

    RSViewController *rootViewController = [[RSViewController alloc] init];
    rootViewController.view.backgroundColor = [UIColor redColor];

    window.rootViewController = rootViewController;

    self.window = window;
    [self.window makeKeyAndVisible];

    return YES;
}

@end
