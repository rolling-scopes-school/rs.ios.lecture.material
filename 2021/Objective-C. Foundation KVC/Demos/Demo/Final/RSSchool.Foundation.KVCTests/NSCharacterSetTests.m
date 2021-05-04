//
//  NSCharacterSetTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 1.05.21.
//

#import <XCTest/XCTest.h>

@interface NSCharacterSetTests : XCTestCase

@end

@implementation NSCharacterSetTests

- (void)testCharacterSetWithPunctuation {
    NSString *expectedString = @"iOS Tutorials ";

    NSString *string = @"....iOS Tutorials ,,,.....";
    NSLog(@"Initial String :%@", string);

    NSCharacterSet *characterset = [NSCharacterSet punctuationCharacterSet];
    NSString *actualResult = [string stringByTrimmingCharactersInSet:characterset];
    NSLog(@"Final String :%@", actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testCharacterSetWithCharactersInString {
    NSString *expectedString = @"2021-05-01'T'23:59:59%2B03:00";

    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"+"] invertedSet];
    NSString *queryDateFrom = @"2021-05-01'T'23:59:59+03:00";
    NSString *unescapesString = [queryDateFrom stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    NSLog(@"%@", unescapesString);

    XCTAssertTrue([expectedString isEqualToString:unescapesString]);
}

- (void)testWhitespaceAndNewlineCharacterSet {
    NSString *expectedString = @"test@example.com";

    NSCharacterSet *whiteSpaceAndNewLineCharacterSet = NSCharacterSet.whitespaceAndNewlineCharacterSet;
    NSString *email = @"test@example.com   ";

    NSString *emailWithoutWhitespaces = [email stringByTrimmingCharactersInSet:whiteSpaceAndNewLineCharacterSet];

    XCTAssertTrue([expectedString isEqualToString:emailWithoutWhitespaces]);
}

- (void)testURLQueryAllowedCharacterSet {
    NSString *expectedString = @"character%20set";

    NSCharacterSet *allowedCharacters = NSCharacterSet.URLQueryAllowedCharacterSet;
    NSString *queryString = @"character set";
    NSString *unescapesString = [queryString stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    NSLog(@"%@", unescapesString);

    XCTAssertTrue([expectedString isEqualToString:unescapesString]);
}

- (void)testCharacterSetFromUnion {
    NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.lowercaseLetterCharacterSet];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.uppercaseLetterCharacterSet];
    [characterSet formUnionWithCharacterSet:NSCharacterSet.decimalDigitCharacterSet];
    [characterSet addCharactersInString:@"!@#$%&"];

    NSCharacterSet *forbiddenCharacterSet = [characterSet invertedSet];

    NSString *password = @"123!aA";
    NSRange range = [password rangeOfCharacterFromSet:forbiddenCharacterSet];
    XCTAssertEqual(range.location, NSNotFound);
}

@end
