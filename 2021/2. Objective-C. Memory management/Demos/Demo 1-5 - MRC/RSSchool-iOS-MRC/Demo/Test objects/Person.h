//
//  Person.h
//  RSSchool-iOS-MRC
//
//  Created by Alexei on 2/25/20.
//  Copyright © 2020 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Passport;

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) Passport *passport;

+ (Person *)createPersonWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name;


@end
