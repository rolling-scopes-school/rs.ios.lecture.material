//
//  RSCar.h
//  Objective-C Fundamentals
//
//  Created by Uladzislau Volchyk on 26.04.21.
//

#import "RSVehicle.h"
#import "RSEnterable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSCar : RSVehicle <RSEnterable>

- (void)move;

@end

NS_ASSUME_NONNULL_END
