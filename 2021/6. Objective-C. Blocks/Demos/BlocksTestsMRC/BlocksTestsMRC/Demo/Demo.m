//
//  Demo.m
//  BlocksTestsMRC
//
//  Created by Aliaksei Piatyha on 5/18/21.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import "Demo.h"
#import "SomeClass.h"
#import "BlockClass.h"
#import "Person.h"

typedef NSString* (^StringBlockWithInt)(int) ;

@implementation Demo

- (void)execute {
    [self blockTypesDemo];
    [self capturingLocalVariablesDemo];
    [self retainCycleDemo];
    [self blockUsageDemo];
}

// MARK: - Demo #1 Block types

- (void)blockTypesDemo {
    [self testGlobalBlock];
    [self testStackBlock];
    [self testMallocBlock];

    NSLog(@"\n");
}

- (void)testGlobalBlock {
    StringBlockWithInt globalBlock = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num] autorelease];
    };

    NSLog(@"GlobalBlock type: %@", globalBlock);

    globalBlock(5);
}

- (void)testStackBlock {
    int multiplier = 10;

    StringBlockWithInt stackBlock = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num * multiplier] autorelease];
    };

    NSLog(@"StackBlock type: %@", stackBlock);

    stackBlock(5);
}

- (void)testMallocBlock {
    int multiplier = 10;

    StringBlockWithInt stackBlock = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num * multiplier] autorelease];
    };

    NSString* (^mallocBlock)(int) = [stackBlock copy];

    NSLog(@"StackBlock type: %@", stackBlock);
    NSLog(@"MallocBlock type: %@", mallocBlock);

    mallocBlock(5);

    [mallocBlock release];
}

// MARK: - Demo #2 Capturing local variables

- (void)capturingLocalVariablesDemo {
    [self capturePrimitive];
    [self captureObject];

    NSLog(@"\n");
}

- (void)capturePrimitive {
    __block int multiplier = 10;

    NSString* (^stackBlock)(int) = ^(int num) {
        return [[[NSString alloc] initWithFormat:@"%d", num * multiplier] autorelease];
    };

    multiplier = 20;

    NSLog(@"Block result: %@", stackBlock(5));
}

- (void)captureObject {
    __block SomeClass *obj = [[SomeClass alloc] init];
    obj.someInfo = @"Info 1";

    SomeClass *obj2 = [[SomeClass alloc] init];
    obj2.someInfo = @"Info 2";

    NSString* (^myBlock)(void) = ^{
        obj = obj2;

        return [[[NSString alloc] initWithFormat:@"Obj Info = %@", obj.someInfo] autorelease];
    };

    NSLog(@"Block with object: %@", myBlock());

    [obj release];
    [obj2 release];
}

// MARK: - Retain cycle demo

- (void)retainCycleDemo {
    BlockClass *objWithBlock = [[BlockClass alloc] init];

    NSLog(@"%@ has been created", objWithBlock);

    __block BlockClass *weakObjWithBlock = objWithBlock;

    objWithBlock.block = ^{
        NSLog(@"Object with block description: %@", weakObjWithBlock);
    };

    objWithBlock.block();

    [objWithBlock release];

    NSLog(@"\n");
}

// MARK: - Usage demo

- (void)blockUsageDemo {
    [self sorting];
    [self downloading];

    NSLog(@"\n");
}

- (void)sorting {
    Person *developer = [[Person alloc] initWithTitle:@"Developer" andAge:23];
    Person *qa = [[Person alloc] initWithTitle:@"QA engineer" andAge:20];
    Person *manager = [[Person alloc] initWithTitle:@"Project manager" andAge:30];

    NSArray *team = @[developer, qa, manager];
    NSArray *sortedTeam = [team sortedArrayUsingComparator:^NSComparisonResult(Person* _Nonnull obj1, Person* _Nonnull obj2) {
        if (obj1.age > obj2.age) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    }];

    NSLog(@"Team: %@", team);
    NSLog(@"Sorted team by age: %@", sortedTeam);

    [developer release];
    [qa release];
    [manager release];
}


- (void)downloading {
    [NSURLSession.sharedSession
     dataTaskWithURL:[NSURL URLWithString:@"https://host.domain/data"]
     completionHandler:^(NSData * _Nullable data,
                         NSURLResponse * _Nullable response,
                         NSError * _Nullable error) {
        if (error) {
            // Handle error
        }

        if (data) {
            // Process data
        }
    }];
}

@end
