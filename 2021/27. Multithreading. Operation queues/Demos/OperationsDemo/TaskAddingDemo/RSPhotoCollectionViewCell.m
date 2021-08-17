//
//  RSPhotoCollectionViewCell.m
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSPhotoCollectionViewCell.h"
#import "DataSourceItem.h"

@interface RSPhotoCollectionViewCell ()

@property (nonatomic, retain) UIImageView *photoImageView;

@end

@implementation RSPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _photoImageView = [[UIImageView alloc] init];
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.photoImageView];
    self.photoImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [self.photoImageView.leadingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leadingAnchor],
        [self.photoImageView.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.topAnchor],
        [self.photoImageView.trailingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.trailingAnchor],
        [self.photoImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    self.photoImageView.layer.cornerRadius = 10.0;
    self.photoImageView.clipsToBounds = YES;
}

- (void)configureWithItem:(DataSourceItem *)item {
    if (item.image) {
        self.photoImageView.image = item.image;
    } else {
        self.photoImageView.image = [UIImage imageNamed:@"Placeholder"];
    }
}

@end
