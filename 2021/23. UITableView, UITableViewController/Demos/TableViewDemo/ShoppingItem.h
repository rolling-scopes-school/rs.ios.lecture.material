//
//  ShoppingItem.h
//  TableViewDemo
//
//  Created by Victor Semenchuk on 4/19/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShoppingItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL completed;

- (instancetype)initWithTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
