//
//  RSProduct.m
//  Demo6_CollectionSorting
//
//  Created by Viktar Semianchuk on 2.05.21.
//

#import "RSProduct.h"

@implementation RSProduct

- (instancetype)initWithTitle:(NSString *)title andCount:(NSUInteger)count; {
    self = [super init];
    if (self) {
        _title = title;
        _count = count;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Title: %@, count: %lu", self.title, self.count];
}

- (NSComparisonResult)compare:(RSProduct *)otherProduct {
    return [self.title compare:otherProduct.title];;
}

@end
