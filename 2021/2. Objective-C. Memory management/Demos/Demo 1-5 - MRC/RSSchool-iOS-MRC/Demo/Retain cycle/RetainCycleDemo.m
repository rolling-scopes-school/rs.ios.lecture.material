//
//  RetainCycleDemo.m
//  RSSchool-iOS-MRC
//
//  Created by Aliaksei Piatyha on 4/29/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "RetainCycleDemo.h"
#import "Person.h"
#import "Passport.h"

@implementation RetainCycleDemo

- (void)execute {
    [self showRetainCycle];
    [self showResolvedRetainCycle];
}

- (void) showRetainCycle {
    NSLog(@"*** Showing retain cycle ***");

    Person *person = [[Person alloc] init];
    NSLog(@"[Person] %@ has been created with retain count: %lu", person, person.retainCount);

    Passport *passport = [[Passport alloc] init];
    NSLog(@"[Passport] %@ has been created with retain count: %lu", passport, passport.retainCount);

    passport.person = person;
    NSLog(@"[Person] retain count after property assignment: %lu", person.retainCount);

    person.passport = passport;
    NSLog(@"[Passport] retain count after property assignment: %lu", passport.retainCount);

    [person release];
    [passport release];

    NSLog(@"\n");
}

- (void) showResolvedRetainCycle {
    NSLog(@"*** Showing resolved retain cycle ***");

    Person *person = [[Person alloc] init];
    NSLog(@"[Person] %@ has been created with retain count: %lu", person, person.retainCount);

    Passport *passport = [[Passport alloc] init];
    NSLog(@"[Passport] %@ has been created with retain count: %lu", passport, passport.retainCount);

    passport.weakPerson = person; // Also can be assign or unsafe_unretained
    NSLog(@"[Person] retain count after property assignment: %lu", person.retainCount);

    person.passport = passport;
    NSLog(@"[Passport] retain count after property assignment: %lu", passport.retainCount);

    [person release];
    [passport release];

    NSLog(@"\n");
}

@end
