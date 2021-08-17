//
//  RSOperation.m
//  AsyncOperationDemo
//
//  Created by Victor Semenchuk on 6/8/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSOperation.h"

@interface RSOperation () {
    BOOL executing;
    BOOL finished;
}

- (void)finishOperation;

@end

@implementation RSOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        executing = NO;
        finished = NO;
    }
    return self;
}

- (BOOL)isAsynchronous {
    return [self isConcurrent];
}

- (BOOL)isConcurrent {
    return YES;
}

- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

- (void)start {
    if (self.isCancelled) {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }

    [self willChangeValueForKey:@"isExecuting"];
    [self main];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main {
    NSLog(@"Operation started");
    dispatch_queue_t queue = dispatch_get_global_queue(QOS_CLASS_UTILITY, 0);
    dispatch_async(queue, ^{
        sleep(5);
        [self finishOperation];
    });
}

- (void)finishOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];

    executing = NO;
    finished = YES;

    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

@end
