//
//  RSPhotoCollectionViewCell.h
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DataSourceItem;

@interface RSPhotoCollectionViewCell : UICollectionViewCell

- (void)configureWithItem:(DataSourceItem *)item;

@end

NS_ASSUME_NONNULL_END
