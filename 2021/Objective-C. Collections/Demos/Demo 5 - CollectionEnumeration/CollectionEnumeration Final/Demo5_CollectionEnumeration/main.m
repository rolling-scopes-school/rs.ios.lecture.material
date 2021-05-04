//
//  main.m
//  Demo5_CollectionEnumeration
//
//  Created by Viktar Semianchuk on 2.05.21.
//

#import <Foundation/Foundation.h>

void cStyledEnumerationDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];

    for (NSUInteger index = 0; index < array.count; index++) {
        NSLog(@"index = %lu, value = %@", index, array[index]);

        if (index == 1) {
            [array removeObjectAtIndex:index];
        }
    }
}

void fastEnumerationDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSNumber *num2 = @2;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, num2, @3, nil];

    for (id object in array) {
        NSLog(@"object = %@", object);

        // The app will crash
//        if (object == num2) {
//            [array removeObject:@2];
//        }
    }
}

void blockBasedEnumerationDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSNumber *num2 = @2;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, num2, @3, nil];

    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"idx = %lu, obj = %@", idx, obj);

        if (obj == num2) {
            NSLog(@"Stop enumeration");
            *stop = YES;
        }
    }];
}

void enumeratorDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];

    NSEnumerator *enumerator = [array reverseObjectEnumerator];

    id object;
    while(object = [enumerator nextObject]) {
        NSLog(@"object = %@", object);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. cStyledEnumeration
        cStyledEnumerationDemo();

        // 2. fastEnumeration
        fastEnumerationDemo();

        // 3. blockBasedEnumeration
        blockBasedEnumerationDemo();

        // 4. enumerator
        enumeratorDemo();
    }
    return 0;
}
