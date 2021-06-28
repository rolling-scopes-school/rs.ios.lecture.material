//
//  RSViewControllerSecond.m
//  Demo2
//
//  Created by Victor Semenchuk on 3/23/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSViewControllerSecond.h"

@interface RSViewControllerSecond ()

@end

@implementation RSViewControllerSecond

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor darkGrayColor];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150.0, 400.0, 100.0, 40.0)];
    [button setTitle:@"Dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - Handlers

- (void)buttonTapHandler
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
