//
//  RSVehicle.m
//  Objective-C Fundamentals
//
//  Created by Uladzislau Volchyk on 26.04.21.
//

#import "RSVehicle.h"

@interface RSVehicle ()

@property (nonatomic, strong, readwrite) RSPassenger *captain;
@property (nonatomic, assign, readwrite) BOOL running;

@end

@implementation RSVehicle

- (instancetype)initWithPassenger:(RSPassenger *)captain {
    self = [super init];
    if (self) {
        _captain = captain;
        _running = NO;
    }
    return self;
}

- (void)toggleEngine:(BOOL)start {
    self.running = start;
    NSLog(self.running ? @"Engine works" : @"Engine is stopped");
}

@end
