//
//  RSDevice.m
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 28.04.21.
//

#import "RSDevice.h"

@implementation RSDevice

@synthesize name = _name, capacity = _capacity;

- (instancetype)initWithName:(NSString *)name capacity:(NSNumber *)capacity
{
    if (self = [super init]) {
        _name = name;
        _capacity = capacity;
    }
    return self;
}

- (void)setName:(NSString *)name capacity:(NSNumber *)number
{
    self.name = name;
    self.capacity = number;
}

- (BOOL)isEqual:(id)other
{
    if (other == self) {
        return YES;
    }

    if (![other isKindOfClass:RSDevice.class]) {
        return NO;
    }

    return [self isEqualToRSDevice:(RSDevice *)other];
}

- (BOOL)isEqualToRSDevice:(RSDevice *)otherDevice
{
    return [self.name isEqualToString:otherDevice.name] && [self.capacity isEqualToNumber:otherDevice.capacity];
}

- (NSUInteger)hash
{
    return self.name.hash ^ self.capacity.hash;
}

@end
