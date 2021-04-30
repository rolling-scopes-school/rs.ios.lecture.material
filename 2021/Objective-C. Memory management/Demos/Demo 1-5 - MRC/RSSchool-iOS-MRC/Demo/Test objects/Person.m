//
//  Person.m
//  RSSchool-iOS-MRC
//
//  Created by Alexei on 2/25/20.
//  Copyright © 2020 Alexei. All rights reserved.
//

#import "Person.h"
#import "Passport.h"

@implementation Person

+ (Person *)createPersonWithName:(NSString *)name {
    return [[[Person alloc] initWithName:name] autorelease];
}

- (instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        _name = [name retain];
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"[Person] %@ is being deallocating", self);

    [_passport release];
    [_name release];

    [super dealloc];
}

@end
