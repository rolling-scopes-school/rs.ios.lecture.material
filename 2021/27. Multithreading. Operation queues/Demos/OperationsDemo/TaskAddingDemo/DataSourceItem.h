//
//  DataSourceItem.h
//  TaskAddingDemo
//
//  Created by Viktar Semianchuk on 6/6/20.
//  Copyright © 2020 Viktar Semianchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataSourceItem : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithUrl:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
