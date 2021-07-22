//
//  SceneDelegate.m
//  ContainerViewControllersDemo
//
//  Created by Victor Semenchuk on 4/6/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "SceneDelegate.h"
#import "NavigationDemoViewController.h"
#import "MasterTableViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    [UINavigationBar appearance].backIndicatorImage = [UIImage systemImageNamed:@"arrow.left.circle.fill"];
    [UINavigationBar appearance].backIndicatorTransitionMaskImage = [UIImage systemImageNamed:@"arrow.left.circle.fill"];
    [UIView appearance].tintColor = UIColor.systemIndigoColor;

    UIWindow *window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    window.rootViewController = [self rootViewController];

    self.window = window;
    [self.window makeKeyAndVisible];
}

- (UIViewController *)rootViewController {
    UISplitViewController *splitViewController = [UISplitViewController new];
    splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    splitViewController.primaryEdge = UISplitViewControllerPrimaryEdgeLeading;
    splitViewController.maximumPrimaryColumnWidth = 800.0;
    splitViewController.minimumPrimaryColumnWidth = 600.0;

    UITabBarController *tabBarController = [UITabBarController new];

    NSMutableArray *tabBarControllers = [[NSMutableArray alloc] init];

    UINavigationController *firstViewController = [[UINavigationController alloc] initWithRootViewController:[NavigationDemoViewController new]];
    firstViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Star" image:[UIImage imageNamed:@"Star"] tag:0];
    [tabBarControllers addObject:firstViewController];

    UINavigationController *secondViewController = [[UINavigationController alloc] initWithRootViewController:[MasterTableViewController new]];
    secondViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Paperplane" image:[UIImage systemImageNamed:@"paperplane.fill"] tag:0];
    [tabBarControllers addObject:secondViewController];

    for (int i = 3; i < 10; i++) {
        UIViewController *viewController = [UIViewController new];
        viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"%d", i]
                                                                  image:[UIImage systemImageNamed:[NSString stringWithFormat:@"%d.circle.fill", i]]
                                                                    tag:0];
        [tabBarControllers addObject:viewController];
    }

    tabBarController.viewControllers = tabBarControllers;
    tabBarController.customizableViewControllers = nil;

    splitViewController.viewControllers = @[tabBarController];

    return splitViewController;
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
