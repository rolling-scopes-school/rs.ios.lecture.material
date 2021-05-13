//
//  main.m
//  Demo4_CopyingCollections
//
//  Created by Viktar Semianchuk on 1.05.21.
//

#import <Foundation/Foundation.h>

void shallowCopyDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    // TODO: Add implementation
}

void deepCopyDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    // TODO: Add implementation
}

void trueDeepCopyDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    // TODO: Add implementation
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
