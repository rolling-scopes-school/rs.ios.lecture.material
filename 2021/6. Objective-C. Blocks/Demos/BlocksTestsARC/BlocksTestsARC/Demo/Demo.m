//
//  Demo.m
//  BlocksTestsARC
//
//  Created by Aliaksei Piatyha on 5/18/21.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import "Demo.h"
#import "BlockClass.h"

typedef NSString* (^StringBlockWithInt)(int) ;

@implementation Demo

- (void)execute {
//    [self blockTypesDemo];
    [self retainCycleDemo];
}

// MARK: - Demo #1 Block types

- (void)blockTypesDemo {
    [self testGlobalBlock];
    [self testMallocBlock];

    NSLog(@"\n");
}

- (void)testGlobalBlock {
    StringBlockWithInt globalBlock = ^(int num) {
        return [[NSString alloc] initWithFormat:@"%d", num];
    };

    NSLog(@"GlobalBlock type: %@", globalBlock);

    globalBlock(5);
}

- (void)testMallocBlock {
    int multiplier = 10;

    StringBlockWithInt stackBlock = ^(int num) {
        return [[NSString alloc] initWithFormat:@"%d", num * multiplier];
    };

    [stackBlock copy];

    NSString* (^mallocBlock)(int) = [stackBlock copy];

    NSLog(@"StackBlock type: %@", stackBlock);
    NSLog(@"MallocBlock type: %@", mallocBlock);

    mallocBlock(5);
}

// MARK: - Retain cycle demo

- (void)retainCycleDemo {
    BlockClass *objWithBlock = [[BlockClass alloc] init];

    NSLog(@"%@ has been created", objWithBlock);

    __weak BlockClass *weakObjWithBlock = objWithBlock;

    objWithBlock.block = ^{
        NSLog(@"Object with block description: %@", weakObjWithBlock);
    };

    objWithBlock.block();

    NSLog(@"\n");
}

@end
