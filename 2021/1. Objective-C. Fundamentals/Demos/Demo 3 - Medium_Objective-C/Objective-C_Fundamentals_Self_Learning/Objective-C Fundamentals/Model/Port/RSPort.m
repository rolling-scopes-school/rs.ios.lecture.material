//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import "RSPort.h"

@interface RSPort ()

@property (nonatomic, strong) NSMutableArray<RSVehicle *> *trackPool;

@end

@implementation RSPort

- (instancetype)init
{
    self = [super init];
    if (self) {
        _trackPool = [NSMutableArray new];
    }
    return self;
}

- (void)launchVehicle:(RSVehicle *)vehicle {
    [self.trackPool addObject:vehicle];
    [vehicle toggleEngine:YES];
    [vehicle move];
}

- (void)enter:(id<RSPortEnterable>)entry {
    NSLog(@"Object %@, welcome!", entry.identifier);
}

@end
