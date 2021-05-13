//
//  Person.m
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 2.05.21.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithFirstName:(NSString *)firstName {
    if (self = [super init]) {
        self.firstName = firstName;
    }
    return self;
}

@end
