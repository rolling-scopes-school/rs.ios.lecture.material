//
//  RSMentor.h
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSMentor : NSObject

@property (nonatomic, assign) NSUInteger mentorId;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

- (instancetype)initWithId:(NSUInteger)mentorId
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName;

@end
