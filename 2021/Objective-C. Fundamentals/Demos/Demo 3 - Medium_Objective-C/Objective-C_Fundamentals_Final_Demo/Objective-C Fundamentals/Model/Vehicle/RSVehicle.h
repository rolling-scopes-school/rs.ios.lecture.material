//
//  RSVehicle.h
//  Objective-C Fundamentals
//
//  Created by Uladzislau Volchyk on 26.04.21.
//

#import <Foundation/Foundation.h>
#import "RSPassenger.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSVehicle : NSObject

@property (nonatomic, strong, readonly) RSPassenger *captain;
@property (nonatomic, assign, readonly) BOOL running;

- (instancetype)initWithPassenger:(RSPassenger *)captain;
- (void)toggleEngine:(BOOL)start;

@end

NS_ASSUME_NONNULL_END
