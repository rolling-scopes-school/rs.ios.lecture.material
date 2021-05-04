//
//  main.m
//  Demo3_WorkingWithSet
//
//  Created by Viktar Semianchuk on 1.05.21.
//

#import <Foundation/Foundation.h>
#import "RSProduct.h"

void immutableSetDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSSet *immutableSet = [NSSet setWithObjects:@1, @2, @3, nil];
    NSLog(@"1. immutableSet = %@", immutableSet);
    NSLog(@"2. Immutable set count = %lu", immutableSet.count);

    NSArray *allObjects = immutableSet.allObjects;
    NSLog(@"3. allObjects = %@", allObjects);

    NSArray *anyObject = immutableSet.anyObject;
    NSLog(@"4. anyObject = %@", anyObject);

    NSArray *member1 = [immutableSet member:@1];
    NSLog(@"5. member1 = %@", member1);

    NSArray *member5 = [immutableSet member:@5];
    NSLog(@"6. member5 = %@", member5);

    BOOL containsObject1 = [immutableSet containsObject:@1];
    NSLog(@"7. containsObject1 = %d", containsObject1);

    BOOL containsObject5 = [immutableSet containsObject:@5];
    NSLog(@"8. containsObject5 = %d", containsObject5);

    BOOL intersectsSet0 = [immutableSet intersectsSet:[NSSet setWithArray:@[@9, @10]]];
    NSLog(@"9. intersectsSet0 = %d", intersectsSet0);

    BOOL intersectsSet1 = [immutableSet intersectsSet:[NSSet setWithArray:@[@2, @8]]];
    NSLog(@"10. intersectsSet1 = %d", intersectsSet1);

    BOOL isSubsetOfSet0 = [immutableSet isSubsetOfSet:[NSSet setWithArray:@[@2, @4, @5]]];
    NSLog(@"11. isSubsetOfSet0 = %d", isSubsetOfSet0);

    BOOL isSubsetOfSet1 = [immutableSet isSubsetOfSet:[NSSet setWithArray:@[@2, @1,  @3, @3]]];
    NSLog(@"12. isSubsetOfSet1 = %d", isSubsetOfSet1);
}

void mutableSetDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableSet *mutableSet = [NSMutableSet setWithSet:[NSSet setWithArray:@[@1, @2, @3]]];
    NSLog(@"1. mutableSet = %@", mutableSet);

    [mutableSet addObject:@1];
    NSLog(@"2. mutableSet = %@", mutableSet);

    [mutableSet addObject:@4];
    NSLog(@"3. mutableSet = %@", mutableSet);

    [mutableSet removeObject:@4];
    NSLog(@"4. mutableSet = %@", mutableSet);

    [mutableSet minusSet:[NSSet setWithArray:@[@2, @1]]];
    NSLog(@"5. mutableSet = %@", mutableSet);

    [mutableSet unionSet:[NSSet setWithArray:@[@3, @1, @2, @4]]];
    NSLog(@"6. mutableSet = %@", mutableSet);

    [mutableSet intersectSet:[NSSet setWithArray:@[@3, @2, @1, @0]]];
    NSLog(@"7. mutableSet = %@", mutableSet);
}

void countedSetDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSCountedSet *countedSet = [NSCountedSet setWithObjects:@1, @2, @3, nil];
    NSLog(@"1. countedSet = %@", countedSet);
    NSLog(@"2. @1 count = %lu", [countedSet countForObject:@1]);

    [countedSet addObject:@1];
    NSLog(@"3. countedSet = %@", countedSet);
    NSLog(@"4. @1 count = %lu", [countedSet countForObject:@1]);

    [countedSet removeObject:@1];
    NSLog(@"5. countedSet = %@", countedSet);
    NSLog(@"6. @1 count = %lu", [countedSet countForObject:@1]);

    [countedSet removeObject:@1];
    NSLog(@"7. countedSet = %@", countedSet);
    NSLog(@"8. @1 count = %lu", [countedSet countForObject:@1]);
}

void hashTableDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSHashTable *hashTable = [NSHashTable weakObjectsHashTable];
    NSLog(@"4.1 hashTable = %@", hashTable);

    RSProduct *product1 = [[RSProduct alloc] initWithTitle:@"Product 1"];
    [hashTable addObject:product1];
    NSLog(@"4.2 hashTable = %@", hashTable);

    if (YES) {
        @autoreleasepool {
            RSProduct *product2 = [[RSProduct alloc] initWithTitle:@"Product 2"];
            [hashTable addObject:product2];
            NSLog(@"4.3 hashTable = %@", hashTable);
        }
    }

    NSLog(@"4.4 hashTable = %@", hashTable);

    [hashTable removeObject:product1];
    NSLog(@"4.3 hashTable = %@", hashTable);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. Immutable set
        immutableSetDemo();

        // 2. Mutable set
        mutableSetDemo();

        // 3. Counted set
        countedSetDemo();

        // 4. Hash table
        hashTableDemo();
    }
    return 0;
}
