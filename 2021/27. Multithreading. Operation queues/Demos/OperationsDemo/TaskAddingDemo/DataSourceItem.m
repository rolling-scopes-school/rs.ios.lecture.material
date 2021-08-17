//
//  DataSourceItem.m
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "DataSourceItem.h"

@implementation DataSourceItem

- (instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

@end
