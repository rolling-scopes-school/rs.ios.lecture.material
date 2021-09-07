//
//  RSStudent.h
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSMentor.h"

@interface RSStudent : NSObject

@property (nonatomic, assign) NSUInteger studentId;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, assign) double progress;
@property (nonatomic, copy) RSMentor *mentor;

- (instancetype)initWithId:(NSUInteger)studentId
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName
                  location:(NSString *)location
                  progress:(double)progress
                    mentor:(RSMentor *)mentor;

@end
