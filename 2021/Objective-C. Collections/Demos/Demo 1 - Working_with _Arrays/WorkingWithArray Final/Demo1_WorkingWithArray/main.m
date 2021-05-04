//
//  main.m
//  Demo1_WorkingWithArray
//
//  Created by Viktar Semianchuk on 1.05.21.
//

#import <Foundation/Foundation.h>
#import "RSProduct.h"

void immutableArrayDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSArray *immutableArray = @[@1, @2, @3];
    NSLog(@"1. immutableArray = %@", immutableArray);
    NSLog(@"2. Immutable array count = %lu", immutableArray.count);

    NSNumber *objectAtIndex0 = immutableArray[0];
    NSLog(@"3. objectAtIndex0 = %@", objectAtIndex0);

    NSNumber *lastObject = immutableArray.lastObject;
    NSLog(@"4. lastObject = %@", lastObject);

    NSUInteger indexOf2 = [immutableArray indexOfObject:@2];
    NSLog(@"5. indexOf2 = %lu", indexOf2);
}

void mutableArrayDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
    NSLog(@"1. mutableArray = %@", mutableArray);

    [mutableArray addObject:@4];
    NSLog(@"2. mutableArray = %@", mutableArray);

    [mutableArray insertObject:@0 atIndex:0];
    NSLog(@"3. mutableArray = %@", mutableArray);

    [mutableArray replaceObjectAtIndex:1 withObject:@10];
    NSLog(@"4. mutableArray = %@", mutableArray);

    [mutableArray removeObject:@10];
    NSLog(@"5. mutableArray = %@", mutableArray);

    mutableArray[0] = @1;
    NSLog(@"6. mutableArray = %@", mutableArray);
}

void pointerArrayDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSPointerArray *pointerArray = [NSPointerArray weakObjectsPointerArray];
    RSProduct *product1 = [[RSProduct alloc] initWithTitle:@"Product 1"];

    [pointerArray addPointer:(__bridge void *)product1];
    NSLog(@"1. pointerArray count = %lu", pointerArray.count);

    RSProduct *product1FromArray = (__bridge RSProduct *)[pointerArray pointerAtIndex:0];
    NSLog(@"2. product1FromArray = %@", product1FromArray);

    if (YES) {
        @autoreleasepool {
            RSProduct *product2 = [[RSProduct alloc] initWithTitle:@"Product 2"];

            [pointerArray addPointer:(__bridge void *)product2];
            NSLog(@"3. pointerArray count = %lu", pointerArray.count);

            RSProduct *product2FromArray = (__bridge RSProduct *)[pointerArray pointerAtIndex:1];
            NSLog(@"4. product2FromArray = %@", product2FromArray);
        }
    }

    NSLog(@"5. pointerArray count = %lu", pointerArray.count);

    RSProduct *product2FromArray = (__bridge RSProduct *)[pointerArray pointerAtIndex:1];
    NSLog(@"6. product2FromArray = %@", product2FromArray);

    [pointerArray removePointerAtIndex:1];
    NSLog(@"7. pointerArray count = %lu", pointerArray.count);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. Immutable array
        immutableArrayDemo();

        // 2. Mutable array
        mutableArrayDemo();

        // 3. Pointer array
        pointerArrayDemo();
    }
    
    return 0;
}
