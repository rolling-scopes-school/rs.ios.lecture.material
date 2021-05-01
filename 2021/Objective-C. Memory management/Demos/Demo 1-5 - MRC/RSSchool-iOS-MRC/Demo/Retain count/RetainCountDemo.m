//
//  RetainCountDemo.m
//  RSSchool-iOS-MRC
//
//  Created by Aliaksei Piatyha on 4/29/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "RetainCountDemo.h"
#import "Person.h"
#import "Passport.h"

@implementation RetainCountDemo

- (void)execute {
    [self showRetainCount];
//    [self accessToDeallocatedObject];
}

- (void)showRetainCount {
    NSLog(@"*** Showing retain count ***");

    Person *developer = [[Person alloc] init];

    NSLog(@"[Person] Retain count after alloc-init: %lu", developer.retainCount);

    [developer retain];

    NSLog(@"[Person] Retain count after retain: %lu", developer.retainCount);

    [developer release];

    NSLog(@"[Person] Retain count after release: %lu", developer.retainCount);

    [developer release];

    NSLog(@"\n");
}

- (void)accessToDeallocatedObject {
    NSLog(@"*** Accessing to deallocated object ***");

    Person *developer = [[Person alloc] initWithName:@"Creig"];

    [developer release];

    NSLog(@"[Person] Developer's name: %@", developer.name);
    NSLog(@"\n");
}

@end
