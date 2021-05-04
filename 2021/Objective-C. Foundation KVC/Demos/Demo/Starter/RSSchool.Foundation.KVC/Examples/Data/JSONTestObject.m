//
//  JSONTestObject.m
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 1.05.21.
//

#import "JSONTestObject.h"

@implementation JSONTestObject

@synthesize testIdentifier = _testIdentifier;

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:self.testIdentifier forKey:@"testIdentifier"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if (self = [super init]) {
        _testIdentifier = [coder decodeObjectForKey:@"testIdentifier"];
    }
    return self;
}

@end
