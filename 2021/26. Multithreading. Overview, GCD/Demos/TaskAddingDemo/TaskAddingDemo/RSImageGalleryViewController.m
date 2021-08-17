//
//  RSImageGalleryViewController.m
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSImageGalleryViewController.h"
#import "RSPhotoCollectionViewCell.h"
#import "Downloader.h"
#import "DataSourceItem.h"

static NSString *kReuseIdentifier = @"RSPhotoCollectionViewCell";

@interface RSImageGalleryViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (copy, nonatomic) NSArray<DataSourceItem *> *dataSource;

@end

@implementation RSImageGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupDataSource];
    [self.collectionView registerClass:[RSPhotoCollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifier];
}

- (void)downloadImageForIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_async(queue, ^{
        [Downloader downloadFromUrl:[NSString stringWithFormat:@"img%ld", indexPath.item + 1] completion:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.dataSource[indexPath.item].image = image;
                [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
            });
        }];
    });
}

- (void)setupDataSource {
    NSMutableArray *dataSource = [NSMutableArray new];
    for (int i = 1; i <= 10; i++) {
        [dataSource addObject:[[DataSourceItem alloc] initWithUrl:[NSString stringWithFormat:@"img%d", i]]];
    }
    self.dataSource = [dataSource copy];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RSPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier forIndexPath:indexPath];
    DataSourceItem *item = self.dataSource[indexPath.item];
    if (!item.image) {
        [self downloadImageForIndexPath:indexPath];
    }
    [cell configureWithItem:item];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width);
}

#pragma mark - Status bar config

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
