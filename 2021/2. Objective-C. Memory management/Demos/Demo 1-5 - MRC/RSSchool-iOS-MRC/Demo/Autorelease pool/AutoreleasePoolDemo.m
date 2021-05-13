//
//  AutoreleasePoolDemo.m
//  RSSchool-iOS-MRC
//
//  Created by Aliaksei Piatyha on 4/29/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "AutoreleasePoolDemo.h"
#import "Person.h"
#import "Passport.h"

@implementation AutoreleasePoolDemo

- (void)execute {
    [self autoreleaseOwnedString];
    [self autoreleaseNonOwnedString];
    [self autoreleaseStringFromCustomMethod];
    [self autoreleaseLiteralString];
    [self manualAutoreleaseString];
}

- (void)autoreleaseOwnedString {
    NSLog(@"*** Autorelease owned NSString***");

    NSString *ownedString;

    @autoreleasepool {
        ownedString = [[NSString alloc] initWithUTF8String:"Hello, World!"];
        NSLog(@"[Owned NSString] Retain count inside autorelease pool scope: %lu", ownedString.retainCount);
    }

    NSLog(@"[Owned NSString] Retain count outside autorelease pool scope: %lu", ownedString.retainCount);

    [ownedString release];

    NSLog(@"\n");
}

- (void)manualAutoreleaseString {
    NSLog(@"*** Manual autorelease NSString***");

    NSString *string;

    @autoreleasepool {
        string = [[NSString alloc] initWithUTF8String:"Hello, World!"];

        [string retain];
        [string retain];

        [string autorelease];
        [string autorelease];

        NSLog(@"[Literal NSString] Retain count inside autorelease pool scope: %lu", string.retainCount);
    }

    NSLog(@"[Literal NSString] Retain count outside autorelease pool scope: %lu", string.retainCount);

    [string release];

    NSLog(@"\n");
}

- (void)autoreleaseNonOwnedString {
    NSLog(@"*** Autorelease non-owned NSString***");

    NSString *nonOwnedString;

    @autoreleasepool {
        nonOwnedString = [NSString stringWithUTF8String:"Hello, World!"];

        [nonOwnedString retain];

        NSLog(@"[Non-owned NSString] Retain count inside autorelease pool scope: %lu", nonOwnedString.retainCount);
    }

    NSLog(@"[Non-owned NSString] Retain count outside autorelease pool scope: %lu", nonOwnedString.retainCount);

    [nonOwnedString release];

    NSLog(@"\n");
}

- (void)autoreleaseStringFromCustomMethod {
    NSLog(@"*** Autorelease string from custom method ***");

    NSString *string;

    @autoreleasepool {
        string = [self getMessage];

        [string retain];

        NSLog(@"[NSString] Retain count inside autorelease pool scope: %lu", string.retainCount);
    }

    NSLog(@"[NSString] Retain count outside autorelease pool scope: %lu", string.retainCount);

    [string release];

    NSLog(@"\n");
}

- (void)autoreleaseLiteralString {
    NSLog(@"*** Autorelease literal NSString***");

    NSString *literalString;

    @autoreleasepool {
        literalString = @"Hello, World!";
        NSLog(@"[Literal NSString] Retain count inside autorelease pool scope: %lu", literalString.retainCount);
    }

    NSLog(@"[Literal NSString] Retain count outside autorelease pool scope: %lu", literalString.retainCount);
    NSLog(@"\n");
}

- (NSString *)getMessage {
    NSString *message = [[NSString alloc] initWithUTF8String:"Hello, world!"];

    return [message autorelease];
}

@end
