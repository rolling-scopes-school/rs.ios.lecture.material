//
//  Demo.h
//  RSSchool-iOS-MRC
//
//  Created by Aliaksei Piatyha on 4/29/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DemoProtocol

- (void)execute;

@end

@interface Demo : NSObject<DemoProtocol>

@end

NS_ASSUME_NONNULL_END
