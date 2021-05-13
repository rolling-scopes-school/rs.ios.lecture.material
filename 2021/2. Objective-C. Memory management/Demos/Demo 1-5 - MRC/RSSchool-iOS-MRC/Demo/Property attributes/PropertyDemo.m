//
//  PropertyDemo.m
//  RSSchool-iOS-MRC
//
//  Created by Aliaksei Piatyha on 4/29/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "PropertyDemo.h"
#import "Person.h"
#import "Passport.h"

@implementation PropertyDemo

- (void)execute {
    [self propertyWithRetain];
    [self propertyWithCopy];
    [self propertyWithAssign];

    [self propertyWithWeak];
    [self propertyWithAssign];

    [self deallocatedPropertyWithWeak];
//    [self deallocatedPropertyWithUnsafe];
//    [self deallocatedPropertyWithAssign];
}

- (void)propertyWithRetain {
    NSLog(@"*** Showing property with retain attribute ***");

    Person *person = [[Person alloc] init];

    Passport *passport = [[Passport alloc] init];
    NSLog(@"[Passport] %@ has been created with retain count: %lu", passport, passport.retainCount);

    person.passport = passport;
    NSLog(@"[Passport] retain count after property assignment: %lu", passport.retainCount);

    [person release];
    [passport release];

    NSLog(@"\n");
}

- (void)propertyWithCopy {
    NSLog(@"*** Showing property with copy attribute ***");

    Person *person = [[Person alloc] init];

    NSString *name = [[NSString alloc] initWithUTF8String:"Hello, World!"];
    NSLog(@"[NSString] has been created with retain count: %lu", name.retainCount);

    person.name = name;
    NSLog(@"[NSString] retain count after property assignment: %lu", name.retainCount);

    [person release];
    [name release];

    NSLog(@"\n");
}

- (void)propertyWithAssign {
    NSLog(@"*** Showing property with assign attribute ***");

    Passport *passport = [[Passport alloc] init];

    Person *person = [[Person alloc] init];
    NSLog(@"[Person] %@ has been created with retain count: %lu", person, person.retainCount);

    passport.assignablePerson = person;
    NSLog(@"[Person] retain count after property assignment: %lu", person.retainCount);

    [person release];
    [passport release];

    NSLog(@"\n");
}

- (void)propertyWithWeak {
    NSLog(@"*** Showing property with weak attribute ***");

    Passport *passport = [[Passport alloc] init];

    Person *person = [[Person alloc] init];
    NSLog(@"[Person] %@ has been created with retain count: %lu", person, person.retainCount);

    passport.weakPerson = person;
    NSLog(@"[Person] retain count after property assignment: %lu", person.retainCount);

    [person release];
    [passport release];

    NSLog(@"\n");
}

- (void)propertyWithUnsafe {
    NSLog(@"*** Showing property with unsafe_unretained attribute ***");

    Passport *passport = [[Passport alloc] init];

    Person *person = [[Person alloc] init];
    NSLog(@"[Person] %@ has been created with retain count: %lu", person, person.retainCount);

    passport.unsafePerson = person;
    NSLog(@"[Person] retain count after property assignment: %lu", person.retainCount);

    [person release];
    [passport release];

    NSLog(@"\n");
}

- (void)deallocatedPropertyWithWeak {
    NSLog(@"*** Accessing deallocated property with weak attribute ***");

    Passport *passport = [[Passport alloc] init];
    Person *person = [[Person alloc] initWithName:@"Creig"];

    passport.weakPerson = person;

    [person release];

    NSLog(@"Try to access to deallocated property with weak: %@", passport.weakPerson.name);

    [passport release];

    NSLog(@"\n");
}

- (void)deallocatedPropertyWithUnsafe {
    NSLog(@"*** Accessing deallocated property with unsafe_unretained attribute ***");

    Passport *passport = [[Passport alloc] init];
    Person *person = [[Person alloc] initWithName:@"Creig"];

    passport.unsafePerson = person;

    [person release];

    NSLog(@"Try to access to deallocated property with unsafe_unretained: %@", passport.unsafePerson.name);

    [passport release];

    NSLog(@"\n");
}

- (void)deallocatedPropertyWithAssign {
    NSLog(@"*** Accessing deallocated property with assign attribute ***");

    Passport *passport = [[Passport alloc] init];
    Person *person = [[Person alloc] initWithName:@"Creig"];

    passport.assignablePerson = person;

    [person release];

    NSLog(@"Try to access to deallocated property with assign: %@", passport.assignablePerson.name);

    [passport release];

    NSLog(@"\n");
}

@end
