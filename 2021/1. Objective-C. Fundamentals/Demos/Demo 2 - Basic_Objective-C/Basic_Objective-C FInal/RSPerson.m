#import "RSPerson.h"

@implementation RSPerson

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}

- (void)sayHello {
    NSLog(@"\nHello, my name is %@!\n", _name);
}

@end