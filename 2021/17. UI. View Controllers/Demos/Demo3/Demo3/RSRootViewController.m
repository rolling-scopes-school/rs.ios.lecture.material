//
//  RSRootViewController.m
//  Demo3
//
//  Created by Victor Semenchuk on 3/23/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSRootViewController.h"
#import "RSChildViewController.h"

@interface RSRootViewController ()

@property (weak, nonatomic) IBOutlet UIView *toolBarView;
@property (assign, nonatomic) BOOL isChildViewControllerAdded;
@property (strong, nonatomic) RSChildViewController *childVC;

@end

@implementation RSRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.isChildViewControllerAdded = NO;
}

- (IBAction)toggleChildVC:(id)sender
{
    if (self.isChildViewControllerAdded) {
        NSLog(@"Remove child view controller");
        self.isChildViewControllerAdded = NO;

        // Logic to remove child view controller
        [self.childVC willMoveToParentViewController:nil];
        [self.childVC.view removeFromSuperview];
        [self.childVC removeFromParentViewController];
    } else {
        NSLog(@"Add child view controller");
        self.isChildViewControllerAdded = YES;

        // Logic to add child view controller
        self.childVC = [[RSChildViewController alloc] init];
        [self addChildViewController:self.childVC];
        self.childVC.view.frame = [self frameForChildVC];
        [self.view addSubview:self.childVC.view];
        [self.childVC didMoveToParentViewController:self];
    }
}

- (CGRect)frameForChildVC
{
    return CGRectMake(0.0,
                      self.toolBarView.bounds.size.height,
                      self.view.bounds.size.width,
                      self.view.bounds.size.height - self.toolBarView.bounds.size.height);
}

@end
