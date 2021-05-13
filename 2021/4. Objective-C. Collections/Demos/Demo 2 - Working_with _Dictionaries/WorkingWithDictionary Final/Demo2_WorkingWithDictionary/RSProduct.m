//
//  RSProduct.m
//  Demo2_WorkingWithDictionary
//
//  Created by Viktar Semianchuk on 2.05.21.
//

#import "RSProduct.h"

@implementation RSProduct

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _title = title;
    }
    return self;
}

@end
