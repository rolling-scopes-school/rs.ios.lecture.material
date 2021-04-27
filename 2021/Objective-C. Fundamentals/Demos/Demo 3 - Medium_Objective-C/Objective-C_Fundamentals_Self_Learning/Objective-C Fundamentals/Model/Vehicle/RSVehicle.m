//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import "RSVehicle.h"

@interface RSVehicle ()

@property (nonatomic, assign, readwrite, getter=isRunning) BOOL running;
@property (nonatomic, strong, readwrite) NSArray<RSPassenger *> *crew;

@end

@implementation RSVehicle

@synthesize identifier = _identifier;

- (instancetype)initWithCrew:(NSArray<RSPassenger *> *)crew {
    self = [super init];
    if (self) {
        _crew = crew;
        _running = NO;
        _identifier = [NSUUID UUID].UUIDString;
    }
    return self;
}

- (void)toggleEngine:(BOOL)start {
    self.running = start;
    NSLog(self.isRunning ? @"Engine works" : @"Engine is stopped");
}

- (void)move {
    assert(false);
}

@end
