//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import <Foundation/Foundation.h>
#import "RSVehicle.h"
#import "RSPortEnterable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSPort : NSObject

- (void)launchVehicle:(RSVehicle *)vehicle;
- (void)enter:(id<RSPortEnterable>)entry;

@end

NS_ASSUME_NONNULL_END
