//
//  NSNumberFormatterTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 1.05.21.
//

#import <XCTest/XCTest.h>

@interface NSNumberFormatterTests : XCTestCase

@end

@implementation NSNumberFormatterTests

- (void)testExample {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.maximumFractionDigits = 2;
    numberFormatter.minimumFractionDigits = 1;
    numberFormatter.negativePrefix = @"-";
    numberFormatter.positivePrefix = @"+";

    numberFormatter.positiveFormat = @"+ @";
    numberFormatter.negativeFormat = @"- @";

    numberFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    numberFormatter.currencyCode = @"EUR";

    NSLog(@"%@", [numberFormatter stringFromNumber:@(20)]);
}

@end
