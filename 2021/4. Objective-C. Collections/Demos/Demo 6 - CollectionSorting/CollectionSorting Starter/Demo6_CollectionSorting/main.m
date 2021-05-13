//
//  main.m
//  Demo6_CollectionSorting
//
//  Created by Viktar Semianchuk on 2.05.21.
//

#import <Foundation/Foundation.h>
#import "RSProduct.h"

void usingSelectorDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSArray *array = [NSArray arrayWithObjects:
                      [[RSProduct alloc] initWithTitle:@"A" andCount:20],
                      [[RSProduct alloc] initWithTitle:@"B" andCount:4],
                      [[RSProduct alloc] initWithTitle:@"A" andCount:10],
                      [[RSProduct alloc] initWithTitle:@"C" andCount:2],
                      [[RSProduct alloc] initWithTitle:@"A" andCount:4],
                      nil];
    NSLog(@"array = %@", array);

    // TODO: Add implementation
}

void usingComparatorDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSArray *array = [NSArray arrayWithObjects:
                      [[RSProduct alloc] initWithTitle:@"A" andCount:20],
                      [[RSProduct alloc] initWithTitle:@"B" andCount:4],
                      [[RSProduct alloc] initWithTitle:@"A" andCount:10],
                      [[RSProduct alloc] initWithTitle:@"C" andCount:2],
                      [[RSProduct alloc] initWithTitle:@"A" andCount:4],
                      nil];
    NSLog(@"array = %@", array);

    // TODO: Add implementation
}

void usingSortDescriptorDemo(void) {
    NSLog(@"---------------%s---------------", __PRETTY_FUNCTION__);

    NSArray *array = [NSArray arrayWithObjects:
                      [[RSProduct alloc] initWithTitle:@"A" andCount:20],
                      [[RSProduct alloc] initWithTitle:@"B" andCount:4],
                      [[RSProduct alloc] initWithTitle:@"A" andCount:10],
                      [[RSProduct alloc] initWithTitle:@"C" andCount:2],
                      [[RSProduct alloc] initWithTitle:@"A" andCount:4],
                      nil];
    NSLog(@"array = %@", array);

    // TODO: Add implementation
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // 1. Using Selector
        usingSelectorDemo();

        // 2. Using Comparator
        usingComparatorDemo();

        // 3. Using NSSortDescriptor
        usingSortDescriptorDemo();
    }
    return 0;
}
