//
//  RSOperation.h
//  TaskAddingDemo
//
//  Created by Victor Semenchuk on 6/8/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSOperation : NSOperation

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) void(^completion)(UIImage *);

- (instancetype)initWithUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
