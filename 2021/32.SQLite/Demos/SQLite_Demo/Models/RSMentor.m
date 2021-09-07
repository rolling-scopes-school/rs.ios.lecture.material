//
//  RSMentor.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSMentor.h"

@implementation RSMentor

- (instancetype)initWithId:(NSUInteger)mentorId
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName {
    self = [super init];
    if (self) {
        _mentorId = mentorId;
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}

@end
