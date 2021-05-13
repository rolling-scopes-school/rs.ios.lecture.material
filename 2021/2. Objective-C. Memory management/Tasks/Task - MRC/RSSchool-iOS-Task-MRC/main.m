//
//  main.m
//  RSSchool-iOS-MRC
//
//  Created by Alexei on 2/23/20.
//  Copyright © 2020 Alexei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

// MARK: - New default implementation

// TASK 0 - Rewrite main function to support working with MRC

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
