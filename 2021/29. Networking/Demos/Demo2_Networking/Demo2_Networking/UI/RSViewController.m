//
//  RSViewController.m
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSViewController.h"
#import "RSPhotoCollectionViewCell.h"
#import "RSUser.h"
#import "RSUserService.h"
#import "RSJSONParser.h"
#import "RSXMLParser.h"

static NSString *kReuseIdentifier = @"RSPhotoCollectionViewCell";

@interface RSViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) RSUserService *userService;
@property (copy, nonatomic) NSArray<RSUser *> *dataSource;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userService = [[RSUserService alloc] initWithParser:[RSJSONParser new]];
    self.dataSource = [NSArray new];

    [self.collectionView registerNib:[UINib nibWithNibName:kReuseIdentifier bundle:nil]
          forCellWithReuseIdentifier:kReuseIdentifier];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startLoading];
}

- (void)startLoading {
    __weak typeof(self) weakSelf = self;
    [self.activityIndicator startAnimating];
    [self.userService loadUsers:^(NSArray<RSUser *> *users, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error"
                                                                                         message:[NSString stringWithFormat:@"%@", error]
                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
                [weakSelf presentViewController:alertController animated:YES completion:nil];
            } else {
                weakSelf.dataSource = users;
                [weakSelf.collectionView reloadData];
            }
            [weakSelf.activityIndicator stopAnimating];
        });
    }];
}

- (void)loadImageForIndexPath:(NSIndexPath *)indexPath {
    __weak typeof(self) weakSelf = self;
    RSUser *user = self.dataSource[indexPath.item];
    [self.userService loadImageForURL:user.avatarUrl completion:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.dataSource[indexPath.item].image = image;
            [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        });
    }];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RSPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReuseIdentifier
                                                                                forIndexPath:indexPath];
    RSUser *user = self.dataSource[indexPath.item];
    if (!user.image) {
        [self loadImageForIndexPath:indexPath];
    }
    [cell configureWithItem:user];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    RSUser *user = self.dataSource[indexPath.item];
    [self.userService cancelDownloadingForUrl:user.avatarUrl];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.width * 1.173);
}

#pragma mark - Status bar config

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


@end
