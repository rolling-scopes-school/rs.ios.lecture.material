//
//  BlockClass.m
//  BlocksTestsMRC
//
//  Created by Aliaksei Piatyha on 9/17/19.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import "BlockClass.h"

@implementation BlockClass

- (void)dealloc {
    NSLog(@"%@ IS DEALLOCATING", self);

    [_block release];
    [super dealloc];
}

@end
