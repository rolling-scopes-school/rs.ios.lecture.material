//
//  RSViewController.m
//  DispatchGroupDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSViewController.h"
#import "Downloader.h"

@interface RSViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViews;

@property (strong, nonatomic) NSMutableArray *images;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.images = [NSMutableArray new];
    [self setupViews];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startDownloading];
}

- (void)startDownloading {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);

    __weak typeof(self) weakSelf = self;

    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        [Downloader downloadFromUrl:@"img1" completion:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    [weakSelf.images addObject:image];
                }
                dispatch_group_leave(group);
            });
        }];
    });

    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        [Downloader downloadFromUrl:@"img2" completion:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    [weakSelf.images addObject:image];
                }
                dispatch_group_leave(group);
            });
        }];
    });

    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        [Downloader downloadFromUrl:@"img3" completion:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    [weakSelf.images addObject:image];
                }
                dispatch_group_leave(group);
            });
        }];
    });

    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);
        [Downloader downloadFromUrl:@"img4" completion:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (image) {
                    [weakSelf.images addObject:image];
                }
                dispatch_group_leave(group);
            });
        }];
    });

    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"All tasks are completed");
        for (int i = 0; i < weakSelf.images.count; i++) {
            ((UIImageView *)weakSelf.imageViews[i]).image = self.images[i];
        }
    });
}

- (void)setupViews {
    self.containerView.layer.cornerRadius = 10.0;
    self.containerView.clipsToBounds = YES;

    for (UIImageView *imageView in self.imageViews) {
        imageView.image = [UIImage imageNamed:@"Placeholder"];
    }
}

#pragma mark - Status bar config

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
