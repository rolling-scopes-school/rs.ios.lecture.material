//
//  RSCarPort.h
//  Objective-C Fundamentals
//
//  Created by Uladzislau Volchyk on 26.04.21.
//

#import <Foundation/Foundation.h>
#import "RSCar.h"
#import "RSEnterable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSCarPort : NSObject

- (void)launchCar:(RSCar *)car;
- (void)enter:(id<RSEnterable>)entry;

@end

NS_ASSUME_NONNULL_END
