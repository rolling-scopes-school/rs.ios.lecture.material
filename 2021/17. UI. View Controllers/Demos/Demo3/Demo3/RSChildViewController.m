//
//  RSChildViewController.m
//  Demo3
//
//  Created by Victor Semenchuk on 3/23/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSChildViewController.h"

@interface RSChildViewController ()

@end

@implementation RSChildViewController

- (void)loadView
{
    // It is ONLY just for DEMO logs.
    // Never call super class implementation for loadView with production code.
    // You must define root view for this controller inside loadView implemenation.
    [super loadView];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"-----------");
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];

    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    NSLog(@"-----------");
}

@end
