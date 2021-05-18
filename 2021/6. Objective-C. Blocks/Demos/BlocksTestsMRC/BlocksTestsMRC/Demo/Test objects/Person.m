//
//  Person.m
//  BlocksTestsMRC
//
//  Created by Aliaksei Piatyha on 5/18/21.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithTitle:(NSString *)title andAge:(NSInteger)age {
    _title = title;
    _age = age;
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %lu y.o.", self.title, self.age];
}

- (void)dealloc {
    [_title release];
    [super dealloc];
}

@end
