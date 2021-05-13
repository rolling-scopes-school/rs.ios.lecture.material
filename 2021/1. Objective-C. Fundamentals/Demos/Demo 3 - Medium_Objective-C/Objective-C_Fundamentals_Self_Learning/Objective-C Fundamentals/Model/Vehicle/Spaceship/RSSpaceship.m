//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import "RSSpaceship.h"
#import "RSPassenger+Identifiable.h"

@implementation RSSpaceship

- (void)toggleEngine:(BOOL)start {
    for (int i = 1; i <= 8; i++) {
        NSLog(@"Engine No: %d is %@", i, start ? @"started" : @"stopped");
    }
    [super toggleEngine:start];
}

- (void)move {
    NSLog(@"Flying to Mars, %@ is the captain", self.crew.firstObject);
}

- (void)antology {
    size_t counter = 0;
    
    for (RSPassenger *crewMate in self.crew) {
        if ([crewMate isComposter]) {
            counter++;
        }
    }
    
    NSLog(@"There are %lu composters in a crew!", counter);
}

@end
