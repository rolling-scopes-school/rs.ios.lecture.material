//
//  Downloader.h
//  DispatchGroupDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Downloader : NSObject

+ (void)downloadFromUrl:(NSString *)url completion:(void(^)(UIImage *))completion;

@end

NS_ASSUME_NONNULL_END
