//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import "RSPassenger+Identifiable.h"

@implementation RSPassenger (Identifiable)

- (BOOL)isComposter {
    return arc4random() % 2;
}

@end
