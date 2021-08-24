//
//  RSUserService.h
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RSParserProtocol.h"

@class RSUser;

@interface RSUserService : NSObject

- (instancetype)initWithParser:(id<RSParserProtocol>)parser;

- (void)loadUsers:(void(^)(NSArray<RSUser *> *, NSError *))completion;
- (void)loadImageForURL:(NSString *)url completion:(void(^)(UIImage *))completion;
- (void)cancelDownloadingForUrl:(NSString *)url;

@end
