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

    // TODO: Add implementation
}

void mutableSetDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    // TODO: Add implementation
}

void countedSetDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    // TODO: Add implementation
}

void hashTableDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    // TODO: Add implementation
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
