//
//  NSRangesTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 3.05.21.
//

#import <XCTest/XCTest.h>

@interface NSRangesTests : XCTestCase

@end

@implementation NSRangesTests

- (void)testMakeRange {
    NSString *string = @"iOS Tutorials";
    NSRange range = NSMakeRange(0, [string length]);

    NSLog(@"%lu", (unsigned long)range.location);
    NSLog(@"%lu", (unsigned long)range.length);
}

- (void)testRangeOfString {
    NSString *expectedString = @"ipsum";

    NSString *string = @"lorem ipsum dolor sit amet";
    NSRange range = [string rangeOfString:@"ipsum"];

    NSLog(@"%lu", (unsigned long)range.location);
    NSLog(@"%lu", (unsigned long)range.length);

    NSString *substring = [string substringWithRange:range];

    XCTAssertTrue([expectedString isEqualToString:substring]);
}

- (void)testRangeOfStringWhereResultIsNSNotFound {
    NSString *string = @"lorem ipsum dolor sit amet";

    NSUInteger locationInString = [string rangeOfString:@"keyword"].location;

    XCTAssertEqual(locationInString, NSNotFound);
}

@end
