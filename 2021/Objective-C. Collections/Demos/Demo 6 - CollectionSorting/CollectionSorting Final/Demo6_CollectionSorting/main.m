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

    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"sortedArray = %@", sortedArray);
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

    NSArray *sortedArray = [array
                            sortedArrayUsingComparator:^NSComparisonResult(RSProduct *product1,
                                                                           RSProduct *product2) {
        return [product1.title compare:product2.title];
    }];
    NSLog(@"sortedArray = %@", sortedArray);
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

    NSSortDescriptor *descriptor1 = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:NO];
    NSSortDescriptor *descriptor2 = [NSSortDescriptor sortDescriptorWithKey:@"count" ascending:YES];

    NSArray *sortedArray = [array sortedArrayUsingDescriptors:@[descriptor1, descriptor2]];
    NSLog(@"sortedArray = %@", sortedArray);
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
