//
//  Downloader.m
//  DispatchGroupDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "Downloader.h"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@implementation Downloader

+ (void)downloadFromUrl:(NSString *)url completion:(void (^)(UIImage * _Nonnull))completion {
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_async(queue, ^{
        sleep(RAND_FROM_TO(2, 5));
        if (completion) {
            completion([UIImage imageNamed:url]);
        }
    });
}

@end
