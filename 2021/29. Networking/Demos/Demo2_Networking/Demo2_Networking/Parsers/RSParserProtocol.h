//
//  RSParserProtocol.h
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSUser;

@protocol RSParserProtocol <NSObject>

- (void)parseUsers:(NSData *)data completion:(void(^)(NSArray<RSUser *> *, NSError *))completion;

@end
