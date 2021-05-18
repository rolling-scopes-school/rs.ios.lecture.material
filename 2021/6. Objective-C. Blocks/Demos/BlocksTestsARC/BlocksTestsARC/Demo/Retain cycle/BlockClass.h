//
//  BlockClass.h
//  BlocksTestsARC
//
//  Created by Aliaksei Piatyha on 9/17/19.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^VoidBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface BlockClass : NSObject

@property (nonatomic, copy) VoidBlock block;

@end

NS_ASSUME_NONNULL_END
