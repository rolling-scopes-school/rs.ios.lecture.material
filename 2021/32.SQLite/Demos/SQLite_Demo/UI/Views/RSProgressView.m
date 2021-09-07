//
//  RSProgressView.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSProgressView.h"

@interface RSProgressView ()

@property (nonatomic, strong) UIView *progressView;
@property (nonatomic, strong) NSLayoutConstraint *progressViewWidthConstraint;

@end

@implementation RSProgressView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height / 2.0;
    self.progressView.layer.cornerRadius = self.bounds.size.height / 2.0;
    self.clipsToBounds = YES;
}

- (void)setProgress:(CGFloat)progress {
    if (progress >= 0 && progress < 0.33) {
        self.progressView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:59.0/255.0 blue:48.0/255.0 alpha:255.0/255.0];
    } else if (progress >= 0.33 && progress < 0.66) {
        self.progressView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:149.0/255.0 blue:0.0/255.0 alpha:255.0/255.0];
    } else {
        self.progressView.backgroundColor = [UIColor colorWithRed:52.0/255.0 green:199.0/255.0 blue:89.0/255.0 alpha:255.0/255.0];
    }

    NSLayoutConstraint *oldConstraint = self.progressViewWidthConstraint;
    [NSLayoutConstraint deactivateConstraints:@[oldConstraint]];
    self.progressViewWidthConstraint = [self.progressView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:progress];
    [NSLayoutConstraint activateConstraints:@[self.progressViewWidthConstraint]];
    [self.progressView removeConstraint:oldConstraint];
}

#pragma mark - Private methods

- (void)setupViews {
    self.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:234.0/255.0 alpha:255.0/255.0];

    self.progressView = [[UIView alloc] initWithFrame:CGRectZero];
    self.progressView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.progressView];

    self.progressViewWidthConstraint = [self.progressView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:1.0];
    [NSLayoutConstraint activateConstraints:@[
        [self.progressView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.progressView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.progressView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        self.progressViewWidthConstraint
    ]];
}

@end
