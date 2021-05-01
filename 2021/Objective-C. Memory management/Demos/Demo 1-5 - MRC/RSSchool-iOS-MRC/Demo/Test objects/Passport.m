//
//  Passport.m
//  RSSchool-iOS-MRC
//
//  Created by Alexei on 2/25/20.
//  Copyright © 2020 Alexei. All rights reserved.
//

#import "Passport.h"
#import "Person.h"

@implementation Passport

- (void)dealloc
{
    NSLog(@"[Passport] %@ is being deallocating", self);

    [_person release];

    [super dealloc];
}

@end
