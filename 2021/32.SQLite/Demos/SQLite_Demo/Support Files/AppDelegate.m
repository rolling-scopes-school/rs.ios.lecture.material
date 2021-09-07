//
//  AppDelegate.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "AppDelegate.h"
#import "SQLiteManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIView appearance] setTintColor:[UIColor colorWithRed:28.0/255.0 green:28.0/255.0 blue:30.0/255.0 alpha:255.0/255.0]];
    [[SQLiteManager sharedInstance] createDataBaseIfNeeded];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
