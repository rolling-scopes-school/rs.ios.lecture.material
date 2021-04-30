//
//  Demo.m
//  RSSchool-iOS-MRC
//
//  Created by Aliaksei Piatyha on 4/29/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "Demo.h"
#import "RetainCountDemo.h"
#import "PropertyDemo.h"
#import "RetainCycleDemo.h"
#import "AutoreleasePoolDemo.h"

@implementation Demo

- (void)execute {
    RetainCountDemo *retainCountDemo = [[RetainCountDemo alloc] init];
    AutoreleasePoolDemo *autoreleasePoolDemo = [[AutoreleasePoolDemo alloc] init];
    PropertyDemo *propertyDemo = [[PropertyDemo alloc] init];
    RetainCycleDemo *retainCycleDemo = [[RetainCycleDemo alloc] init];

    NSArray *demoArray = [[NSArray alloc] initWithObjects:
                          retainCountDemo,
                          autoreleasePoolDemo,
                          propertyDemo,
                          retainCycleDemo,
                          nil];

    for (NSObject<DemoProtocol>* demo in demoArray) {
        NSLog(@"%@", NSStringFromClass([demo class]));
        NSLog(@"\n");
        [demo execute];
    }

    [demoArray release];
    [retainCountDemo release];
    [autoreleasePoolDemo release];
    [propertyDemo release];
    [retainCycleDemo release];
}

@end
