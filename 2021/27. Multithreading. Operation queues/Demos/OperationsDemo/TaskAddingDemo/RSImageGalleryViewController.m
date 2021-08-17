//
//  RSImageGalleryViewController.m
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSImageGalleryViewController.h"
#import "RSPhotoCollectionViewCell.h"
#import "DataSourceItem.h"
#import "RSOperation.h"
#import "RSFilterOperation.h"

static NSString *kReuseIdentifier = @"RSPhotoCollectionViewCell";

@interface RSImageGalleryViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (copy, nonatomic) NSArray<DataSourceItem *> *dataSource;
@property (strong, nonatomic) NSOperationQueue *queue;
@property (strong, nonatomic) NSMutableDictionary<NSIndexPath *, NSArray<NSOperation *> *> *operations;

@end

@implementation RSImageGalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.queue = [NSOperationQueue new];
    self.operations = [NSMutableDictionary new];
    [self setupDataSource];
    [self.collectionView registerClass:[RSPhotoCollectionViewCell class] forCellWithReuseIdentifier:kReuseIdentifier];
}

- (void)downloadImageForIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;

    [self cancelOperationsForIndexPath:indexPath];

    RSOperation *operation1 = [[RSOperation alloc] initWithUrl:[NSString stringWithFormat:@"img%ld", indexPath.item + 1]];
    RSFilterOperation *operation2 = [RSFilterOperation new];

    self.operations[indexPath] = @[operation1, operation2];

    operation2.completion = ^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.dataSource[indexPath.item].image = image;
            [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        });
    };
    [operation2 addDependency:operation1];

    [self.queue addOperation:operation1];
    [self.queue addOperation:operation2];
}

- (void)cancelOperationsForIndexPath:(NSIndexPath *)indexPath {
    NSArray<NSOperation *> *operations = self.operations[indexPath];
    if (!operations) { return; }
    for (NSOperation *operation in operations) {
        [operation cancel];
    }
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

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    [self cancelOperationsForIndexPath:indexPath];
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
