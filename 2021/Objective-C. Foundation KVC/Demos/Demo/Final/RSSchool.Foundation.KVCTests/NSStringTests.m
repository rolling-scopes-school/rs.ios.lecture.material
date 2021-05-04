//
//  NSStringTests.m
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 1.05.21.
//

#import <XCTest/XCTest.h>

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

- (void)testStringWithFormat {
    NSString *expectedString = @"12356.10";

    float floatValue = 12356.09929484;
    NSString *string = [NSString stringWithFormat:@"%.02f", floatValue];

    XCTAssertTrue([expectedString isEqualToString:string]);
}

- (void)testStringWithFormatExample {
    int intValue = 123;
    char charValue = 'c';
    NSString *string = [NSString stringWithFormat:@"intValue: %x, charValue: %x", intValue, charValue];
    NSLog(@"string: %@", string);
}

- (void)testStringWithFormatPositions {
    NSString *firstString = @"first value";
    NSString *secondString = @"second value";

    NSString *string = [NSString stringWithFormat:@"%2$@, %1$@", firstString, secondString];
    NSLog(@"string: %@", string);
}

- (void)testInitWithDataUsingEncoding {
    NSString *expectedString = @"test";

    NSData *data = [@"test" dataUsingEncoding:NSUTF16BigEndianStringEncoding];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF16BigEndianStringEncoding];

    NSLog(@"String: %@",string);

    XCTAssertTrue([expectedString isEqualToString:string]);
}

- (void)testStringWithCharacters {
    unichar unichar = 0x91;
    NSString *string = [NSString stringWithCharacters:&unichar length:4];
    NSLog(@"String: %@",string);
}

- (void)testWithUTF8String {
    NSString *expectedString = @"test©";

    NSString *string = [NSString stringWithUTF8String:"test©"];
    NSLog(@"String: %@",string);

    XCTAssertTrue([expectedString isEqualToString:string]);
}

- (void)testStringWithContentsOfFile {
    NSString *expectedString = @"File content\n";

    NSError *error = nil;
    NSString *file = [[NSBundle mainBundle] pathForResource:@"sampleText" ofType:@"txt"];
    NSString *string = [NSString stringWithContentsOfFile:file
                                                 encoding:NSUTF8StringEncoding
                                                    error:&error];
    NSLog(@"String: %@",string);

    XCTAssertTrue([expectedString isEqualToString:string]);
}

- (void)testStringFromURL {
    NSURL *url = [NSURL URLWithString:@"https://developer.apple.com/documentation/foundation/nsstring"];
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:url
                                                encoding:NSUTF8StringEncoding
                                                   error:&error];
    NSLog(@"String: %@",string);
}

- (void)testWriteToFile {
    NSURL *documentsURL = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSString *filePath = [documentsURL.path stringByAppendingPathComponent:@"sample-string.txt"];
    NSString *string = @"test file content";
    NSError *error = nil;
    NSLog(@"Write Status: %d",[string writeToFile:filePath
                                       atomically:YES
                                         encoding:NSUTF8StringEncoding
                                            error:&error]);
}

- (void)testStringLength {
    NSUInteger expectedLength = 4;

    NSString *string = @"test";
    NSLog(@"Length: %lu",(unsigned long)string.length);

    XCTAssertEqual(expectedLength, string.length);
}

- (void)testCharacterAtIndex {
    unichar expectedCharacter = 't';

    NSString *string = @"test";
    unichar character = [string characterAtIndex:0];
    NSLog(@"character: %c",character);

    XCTAssertEqual(expectedCharacter, character);
}

- (void)testStringByAppendingFormat {
    NSString *expectedString = @"name: Test, age: 12";

    NSString *string = @"name";
    NSString *actualResult = [string stringByAppendingFormat:@": %@, age: %d", @"Test", 12];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testComponentsSeparatedByString {
    NSArray *expectedComponents = @[
        @"iOS",
        @"Tutorials"
    ];

    NSString *string = @"iOS-Tutorials";
    NSArray *actualResult = [string componentsSeparatedByString:@"-"];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedComponents isEqualToArray:actualResult]);
}

- (void)testSubsctringFromIndex {
    NSString *expectedString = @"Tutorials";

    NSString *string = @"iOS-Tutorials";
    NSString *actualResult = [string substringFromIndex:4];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testSubsctringToIndex {
    NSString *expectedString = @"iOS";

    NSString *string = @"iOS-Tutorials";
    NSString *actualResult = [string substringToIndex:3];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testStringByReplacingOccurrencesOfString {
    NSString *expectedString = @"\nRSSchOOliOS\nTutOrials\nWebsite";

    NSString *string = @"\nRSSchooliOS\nTutorials\nWebsite";
    NSString *actualResult = [string stringByReplacingOccurrencesOfString:@"o" withString:@"O"];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testCaseInsensitiveCompare {
    NSString *string = @"iOS Tutorials";
    NSComparisonResult result =[string caseInsensitiveCompare:@"ios tutorials"];

    XCTAssertEqual(result, NSOrderedSame);
}

- (void)testHasPrefix {
    NSString *string = @"iOS Tutorials";

    XCTAssert([string hasPrefix:@"i"]);
}

- (void)testHasSuffix {
    NSString *string = @"iOS Tutorials";

    XCTAssert([string hasSuffix:@"ls"]);
}

- (void)testCapitalizedString {
    NSString *expectedString = @"Ios Tutorials";

    NSString *string = @"iOS Tutorials";
    NSString *actualResult = [string capitalizedString];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testLowercaseString {
    NSString *expectedString = @"ios tutorials";

    NSString *string = @"iOS Tutorials";
    NSString *actualResult = [string lowercaseString];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

- (void)testUppercaseString {
    NSString *expectedString = @"IOS TUTORIALS";

    NSString *string = @"iOS Tutorials";
    NSString *actualResult = [string uppercaseString];
    NSLog(@"%@",actualResult);

    XCTAssertTrue([expectedString isEqualToString:actualResult]);
}

@end
