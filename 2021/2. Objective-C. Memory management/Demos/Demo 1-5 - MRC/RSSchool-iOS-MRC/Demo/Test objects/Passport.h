//
//  Passport.h
//  RSSchool-iOS-MRC
//
//  Created by Alexei on 2/25/20.
//  Copyright © 2020 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Passport : NSObject

@property (nonatomic, retain) Person *person;
@property (nonatomic, assign) Person *assignablePerson;

@property (nonatomic, unsafe_unretained) Person *unsafePerson;
@property (nonatomic, weak) Person *weakPerson;

@end
