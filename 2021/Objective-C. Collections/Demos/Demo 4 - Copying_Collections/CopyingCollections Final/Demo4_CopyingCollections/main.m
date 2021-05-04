//
//  main.m
//  Demo4_CopyingCollections
//
//  Created by Viktar Semianchuk on 1.05.21.
//

#import <Foundation/Foundation.h>

void shallowCopyDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableString *str = [NSMutableString stringWithString:@"Hello"];
    NSLog(@"original str = %@", str);

    NSArray *array = @[str];
    NSLog(@"original array = %@", array);

    NSArray *copiedArray = [array copy];
    NSLog(@"copied array = %@", copiedArray);

    [str appendString:@" RS Students"];
    NSLog(@"updated str = %@", str);

    NSLog(@"original array str = %@", array.firstObject);
    NSLog(@"copied array str = %@", copiedArray.firstObject);
}

void deepCopyDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableString *str = [NSMutableString stringWithString:@"Hello"];
    NSLog(@"1. str: isMutableString = %d", [str isKindOfClass:NSMutableString.class]);
    NSMutableArray *innerArray = [NSMutableArray arrayWithObjects:str, str, nil];
    NSLog(@"2. innerArray: isMutableArray = %d", [innerArray isKindOfClass:NSMutableArray.class]);
    NSArray *array = @[innerArray];
    NSLog(@"3. array: isArray = %d", [array isKindOfClass:NSArray.class]);

    NSArray *copiedArray = [[NSArray alloc] initWithArray:array copyItems:YES];
    NSLog(@"4. copiedArray: isArray = %d", [copiedArray isKindOfClass:NSArray.class]);
    id copiedInnerArray = copiedArray.firstObject;
    NSLog(@"5. copiedInnerArray isMutableArray = %d", [((NSObject *)copiedInnerArray) isKindOfClass:NSMutableArray.class]);
    id copiedStr = ((NSArray *)copiedInnerArray).firstObject;
    NSLog(@"6. copiedStr isMutableString = %d", [((NSObject *)copiedStr) isKindOfClass:NSMutableString.class]);
}

void trueDeepCopyDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableString *str = [NSMutableString stringWithString:@"Hello"];
    NSLog(@"1. str: isMutableString = %d", [str isKindOfClass:NSMutableString.class]);
    NSMutableArray *innerArray = [NSMutableArray arrayWithObjects:str, str, nil];
    NSLog(@"2. innerArray: isMutableArray = %d", [innerArray isKindOfClass:NSMutableArray.class]);
    NSArray *array = @[innerArray];
    NSLog(@"3. array: isArray = %d", [array isKindOfClass:NSArray.class]);


    NSSet *setOfClasses = [NSSet setWithObjects:[NSArray class], [NSMutableArray class], [NSMutableString class], nil];
    NSData *arrayData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:NO error:nil];
    NSArray *copiedArray = [NSKeyedUnarchiver unarchivedObjectOfClasses:setOfClasses fromData:arrayData error:nil];

    NSLog(@"4. copiedArray: isArray = %d", [copiedArray isKindOfClass:NSArray.class]);
    id copiedInnerArray = copiedArray.firstObject;
    NSLog(@"5. copiedInnerArray isMutableArray = %d", [((NSObject *)copiedInnerArray) isKindOfClass:NSMutableArray.class]);
    id copiedStr = ((NSArray *)copiedInnerArray).firstObject;
    NSLog(@"6. copiedStr isMutableString = %d", [((NSObject *)copiedStr) isKindOfClass:NSMutableString.class]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1. Shallow copy
        shallowCopyDemo();

        // 2. Deep copy
        deepCopyDemo();

        // 3. True deep copy
        trueDeepCopyDemo();
    }
    return 0;
}
