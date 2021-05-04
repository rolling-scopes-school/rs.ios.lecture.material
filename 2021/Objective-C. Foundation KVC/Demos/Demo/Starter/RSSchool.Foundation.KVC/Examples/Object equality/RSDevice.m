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

@end
