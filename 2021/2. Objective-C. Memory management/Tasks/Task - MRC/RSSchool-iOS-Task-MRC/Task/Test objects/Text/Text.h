//
//  Text.h
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printable.h"

@class Page;

NS_ASSUME_NONNULL_BEGIN

@interface Text : NSObject<Printable>

@property (nonatomic, readonly, retain) NSString *content;

- (instancetype)initWithContent:(NSString *)content;
+ (instancetype)textWithContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
