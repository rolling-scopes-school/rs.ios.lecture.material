//
//  RSOperation.m
//  TaskAddingDemo
//
//  Created by Victor Semenchuk on 6/8/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import "RSOperation.h"
#import "Downloader.h"

@interface RSOperation ()

@property (nonatomic, copy) NSString *url;

@end

@implementation RSOperation

- (instancetype)initWithUrl:(NSString *)url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (void)main {
    __weak typeof(self) weakSelf = self;
    if (self.isCancelled) { return; }
    [Downloader downloadFromUrl:self.url completion:^(UIImage *image) {
        if (weakSelf.isCancelled) { return; }
        weakSelf.image = image;
        if (self.completion) {
            self.completion(image);
        }
    }];
}

@end
