//
//  ShoppingItemTableViewCell.h
//  TableViewDemo
//
//  Created by Victor Semenchuk on 4/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ShoppingItem;

@interface ShoppingItemTableViewCell : UITableViewCell

- (void)configureWithShoppingItem:(ShoppingItem *)shoppingItem;

@end

NS_ASSUME_NONNULL_END
