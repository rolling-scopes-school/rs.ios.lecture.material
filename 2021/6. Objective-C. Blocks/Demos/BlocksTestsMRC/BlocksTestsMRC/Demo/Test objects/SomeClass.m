//
//  SomeClass.m
//  BlocksTestsARC
//
//  Created by Aliaksei Piatyha on 9/17/19.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import "SomeClass.h"

@implementation SomeClass

- (void)dealloc {
    [_someInfo release];
    [super dealloc];
}

@end
