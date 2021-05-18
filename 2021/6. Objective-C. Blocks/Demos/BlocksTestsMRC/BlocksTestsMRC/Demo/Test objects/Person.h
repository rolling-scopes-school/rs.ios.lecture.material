//
//  Person.h
//  BlocksTestsMRC
//
//  Created by Aliaksei Piatyha on 5/18/21.
//  Copyright © 2021 Aliaksei Piatyha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person: NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger age;

- (instancetype)initWithTitle:(NSString *)title andAge:(NSInteger)age;

@end

NS_ASSUME_NONNULL_END
