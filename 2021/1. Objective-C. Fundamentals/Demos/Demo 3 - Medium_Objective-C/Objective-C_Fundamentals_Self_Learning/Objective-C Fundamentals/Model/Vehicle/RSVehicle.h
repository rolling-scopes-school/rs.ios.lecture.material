//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import <Foundation/Foundation.h>
#import "RSPassenger.h"
#import "RSPortEnterable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSVehicle : NSObject <RSPortEnterable>

@property (nonatomic, strong, readonly) NSArray<RSPassenger *> *crew;
@property (nonatomic, assign, readonly, getter=isRunning) BOOL running;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCrew:(NSArray<RSPassenger *> *)crew;
- (void)toggleEngine:(BOOL)start;
- (void)move;

@end

NS_ASSUME_NONNULL_END
