//
//  Task.h
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TaskProtocol

- (void)execute;

@end

@interface Task : NSObject<TaskProtocol>

@end

NS_ASSUME_NONNULL_END
