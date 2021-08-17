//
//  RSViewController.m
//  AsyncOperationDemo
//
//  Created by Victor Semenchuk on 6/8/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSViewController.h"
#import "RSOperation.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startOperation];
}

- (void)startOperation {
    RSOperation *operation = [RSOperation new];

    operation.completionBlock = ^{
        NSLog(@"Operation is completed");
    };

    [operation start];

    NSLog(@"Main thread is responsive");
}


@end
