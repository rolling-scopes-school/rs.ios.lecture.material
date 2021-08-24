//
//  RSUser.h
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RSUser : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, copy) NSString *company;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *keySkill;
@property (nonatomic, copy) NSString *avatarUrl;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
