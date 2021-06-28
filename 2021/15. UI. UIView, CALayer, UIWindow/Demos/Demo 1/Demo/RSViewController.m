//
//  RSViewController.m
//  Demo
//
//  Created by Viktar Semianchuk on 3/17/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSViewController.h"
#import "RSView.h"

@interface RSViewController ()

@property (nonatomic, strong) RSView *blueView;
@property (nonatomic, strong) RSView *yellowView;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // creating views
    self.blueView = [[RSView alloc] initWithFrame:CGRectMake(30.0, 150.0, 100.0, 100.0) andColor:[UIColor blueColor]];
    self.yellowView = [[RSView alloc] initWithFrame:CGRectMake(40.0, 200.0, 200.0, 200.0) andColor:[UIColor yellowColor]];
    
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.yellowView];
    
    [self.view bringSubviewToFront:self.blueView];
    
    
    //Adding UIButton
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
    //    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, -60, 60, 60)];
    [button setTitle:@"Tab" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(tapHadle) forControlEvents:UIControlEventTouchUpInside];
    
    [self.blueView addSubview:button];
    
    NSLog(@"Frame: %@", NSStringFromCGRect(self.blueView.frame));
    NSLog(@"Bounds: %@", NSStringFromCGRect(self.blueView.bounds));
}

-(void)tapHadle
{
    NSLog(@"Tab");
    
    [UIView animateWithDuration:1 animations:^{
        self.blueView.transform = CGAffineTransformRotate(self.blueView.transform, M_PI / 6);
    }];
    
    
    [UIView animateWithDuration:1 animations:^{
        self.blueView.transform = CGAffineTransformRotate(self.blueView.transform, M_PI / 6);
    } completion:^(BOOL finished) {
        
        NSLog(@"-----Values after animation------");
        NSLog(@"Frame: %@", NSStringFromCGRect(self.blueView.frame));
        NSLog(@"Bounds: %@", NSStringFromCGRect(self.blueView.bounds));
    }];
}

@end
