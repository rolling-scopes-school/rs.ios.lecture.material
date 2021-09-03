//
//  RSLoader.h
//  Demo1_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSLoader : NSObject

- (void)performGetRequestForUrl:(NSString *)stringUrl
                      arguments:(NSDictionary *)arguments
                     completion:(void(^)(NSDictionary *, NSError *))completion;
- (void)performPostRequestForUrl:(NSString *)stringUrl
                       arguments:(NSDictionary *)arguments
                      completion:(void(^)(NSDictionary *, NSError *))completion;

@end
