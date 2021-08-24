//
//  RSJSONParser.m
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSJSONParser.h"
#import "RSUser.h"

@implementation RSJSONParser

- (void)parseUsers:(NSData *)data completion:(void (^)(NSArray<RSUser *> *, NSError *))completion {
    NSError *error;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        completion(nil, error);
        return;
    }
    NSArray *array = dictionary[@"users"];
    NSMutableArray<RSUser *> *users = [NSMutableArray new];
    for (NSDictionary *item in array) {
        [users addObject:[[RSUser alloc] initWithDictionary:item]];
    }
    completion(users, nil);
}

@end
