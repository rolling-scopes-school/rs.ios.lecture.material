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

    // TODO: Add implementation
}

void fastEnumerationDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSNumber *num2 = @2;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, num2, @3, nil];

    // TODO: Add implementation
}

void blockBasedEnumerationDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSNumber *num2 = @2;
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, num2, @3, nil];

    // TODO: Add implementation
}

void enumeratorDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSMutableArray *array = [NSMutableArray arrayWithObjects:@1, @2, @3, nil];

    // TODO: Add implementation
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
