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

    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(40.0, 60.0, 300.0, 300.0)];

    myView.layer.cornerRadius = 20.0;
    myView.layer.borderColor = [UIColor yellowColor].CGColor;
    myView.layer.borderWidth = 3.0;
    myView.layer.backgroundColor = [UIColor purpleColor].CGColor;

    myView.layer.shadowOffset = CGSizeMake(-15.0, 20.0);
    myView.layer.shadowRadius = 5.0;
    myView.layer.shadowOpacity = 0.5;

    CALayer *blueSublayer = [CALayer layer];
    blueSublayer.backgroundColor = [UIColor blueColor].CGColor;
    blueSublayer.frame = CGRectMake(30.0, 30.0, 100.0, 150.0);
    [myView.layer addSublayer:blueSublayer];

    [self.view addSubview:myView];
}

@end
