//
//  RSViewController.m
//  Demo 2
//
//  Created by Viktar Semianchuk on 3/17/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSViewController.h"

@interface RSViewController ()

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(40, 60, 300, 300)];
    myView.layer.backgroundColor = [UIColor purpleColor].CGColor;
    myView.layer.cornerRadius = 20;
    myView.layer.borderWidth = 3;
    myView.layer.borderColor = [UIColor yellowColor].CGColor;
    
    myView.layer.shadowOffset = CGSizeMake(-15, 20);
    myView.layer.shadowRadius = 5;
    myView.layer.shadowOpacity = 0.5;
    
    CALayer *blueSubLayer = [CALayer layer];
    blueSubLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueSubLayer.frame = CGRectMake(30, 30, 100, 150);
    [myView.layer addSublayer:blueSubLayer];
    
    [self.view addSubview:myView];

    
}

@end
