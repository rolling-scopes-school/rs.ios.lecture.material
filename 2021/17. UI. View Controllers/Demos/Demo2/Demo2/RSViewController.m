//
//  RSViewController.m
//  Demo2
//
//  Created by Victor Semenchuk on 3/23/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSViewController.h"
#import "RSViewControllerSecond.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 200.0, 200.0)];
    view.backgroundColor = [UIColor lightGrayColor];
    self.view = view;

    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"-----------");
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150.0, 400.0, 100.0, 40.0)];
    [button setTitle:@"Present" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapHandler) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

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

#pragma mark - Handlers

- (void)buttonTapHandler
{
    RSViewControllerSecond *vc = [[RSViewControllerSecond alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
