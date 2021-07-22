//
//  ShoppingItem.m
//  TableViewDemo
//
//  Created by Victor Semenchuk on 4/19/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "ShoppingItem.h"

@implementation ShoppingItem

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
        _completed = NO;
    }
    return self;
}

@end
