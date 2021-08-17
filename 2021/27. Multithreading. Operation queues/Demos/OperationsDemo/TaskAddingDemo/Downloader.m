//
//  Downloader.m
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "Downloader.h"

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

@implementation Downloader

+ (void)downloadFromUrl:(NSString *)url completion:(void (^)(UIImage * _Nonnull))completion {
    sleep(RAND_FROM_TO(2, 5));
    if (completion) {
        completion([UIImage imageNamed:url]);
    }
}

@end
