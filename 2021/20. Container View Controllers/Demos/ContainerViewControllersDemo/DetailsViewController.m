//
//  DetailsViewController.m
//  ContainerViewControllersDemo
//
//  Created by Victor Semenchuk on 4/6/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation DetailsViewController

- (instancetype)initWithImageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:imageName]];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:self.imageView];
}

- (void)viewDidLayoutSubviews {
    [self positionViews];
}

- (void)positionViews {
    CGFloat sideLength = MIN(self.view.bounds.size.width, self.view.bounds.size.height) / 2.0;
    self.imageView.frame = CGRectMake(0.0, 0.0, sideLength, sideLength);
    self.imageView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
}

@end
