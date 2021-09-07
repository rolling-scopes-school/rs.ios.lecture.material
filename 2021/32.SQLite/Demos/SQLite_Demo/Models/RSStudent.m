//
//  RSStudent.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSStudent.h"

@implementation RSStudent

- (instancetype)initWithId:(NSUInteger)studentId
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName
                  location:(NSString *)location
                  progress:(double)progress
                    mentor:(RSMentor *)mentor {
    self = [super init];
    if (self) {
        _studentId = studentId;
        _firstName = firstName;
        _lastName = lastName;
        _location = location;
        _progress = progress;
        _mentor = mentor;
    }
    return self;
}

@end
