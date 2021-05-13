//
//  main.m
//  Demo2_WorkingWithDictionary
//
//  Created by Viktar Semianchuk on 1.05.21.
//

#import <Foundation/Foundation.h>
#import "RSProduct.h"

void immutableDictionaryDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSDictionary *immutableDictionary = @{@"Key1": @1, @"Key2": @2};
    NSLog(@"1. immutableDictionary = %@", immutableDictionary);

    NSNumber *numberForKey1 = immutableDictionary[@"Key1"];
    NSLog(@"2. numberForKey1 = %@", numberForKey1);

    NSArray *allKeys = immutableDictionary.allKeys;
    NSLog(@"3. allKeys = %@", allKeys);

    NSArray *allValues = immutableDictionary.allValues;
    NSLog(@"4. allValues = %@", allValues);
}

void mutableDictionaryDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableDictionary *mutableDictionary = [NSMutableDictionary
                                              dictionaryWithDictionary:@{@"Key1": @1, @"Key2": @2}];
    NSLog(@"1. mutableDictionary = %@", mutableDictionary);

    mutableDictionary[@"Key3"] = @3;
    NSLog(@"2. mutableDictionary = %@", mutableDictionary);

    mutableDictionary[@"Key1"] = @0;
    NSLog(@"3. mutableDictionary = %@", mutableDictionary);

    mutableDictionary[@"Key2"] = nil;
    NSLog(@"4. mutableDictionary = %@", mutableDictionary);
}

void mapTableDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMapTable *mapTable = [NSMapTable weakToWeakObjectsMapTable];

    NSString *key1 = @"Key1";
    RSProduct *value1 = [[RSProduct alloc] initWithTitle:@"Product 1"];
    [mapTable setObject:value1 forKey:key1];
    NSLog(@"3.1 mapTable = %@", mapTable);

    if (YES) {
        @autoreleasepool {
            NSString *key2 = @"Key2";
            RSProduct *value2 = [[RSProduct alloc] initWithTitle:@"Product 2"];
            [mapTable setObject:value2 forKey:key2];
            NSLog(@"3.2 mapTable = %@", mapTable);
        }
    }

    NSLog(@"3.3 mapTable = %@", mapTable);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. Immutable dictionary
        immutableDictionaryDemo();

        // 2. Mutable dictionary
        mutableDictionaryDemo();

        // 3. Map table
        mapTableDemo();
    }
    return 0;
}
