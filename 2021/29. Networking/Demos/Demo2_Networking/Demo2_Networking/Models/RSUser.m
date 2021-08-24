//
//  RSUser.m
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSUser.h"

@implementation RSUser

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSDictionary *personalInfo = dictionary[@"personInfo"];
        _age = [personalInfo[@"age"] intValue];
        _firstName = personalInfo[@"firstName"];
        _lastName = personalInfo[@"lastName"];

        NSDictionary *work = dictionary[@"work"];
        _company = work[@"company"];
        _keySkill = work[@"keySkill"];
        _title = work[@"title"];

        _avatarUrl = dictionary[@"avatarUrl"];
    }
    return self;
}

@end
