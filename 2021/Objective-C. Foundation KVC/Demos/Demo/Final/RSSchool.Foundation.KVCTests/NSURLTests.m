//
//  NSURLTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 2.05.21.
//

#import <XCTest/XCTest.h>

@interface NSURLTests : XCTestCase

@end

@implementation NSURLTests

- (void)testFileURLWithPath {
    NSURL *baseURL = [NSURL fileURLWithPath:@"file:///path/to/user/"];
    NSURL *URL = [NSURL URLWithString:@"folder/file.html" relativeToURL:baseURL];

    NSLog(@"%@", URL.absoluteString);
}

- (void)testURLWithString {
    NSString *urlString = @"https://bookflow.ru/wp-content/uploads/2017/11/Objective-C.png";
    NSURL *url = [NSURL URLWithString:urlString];

    NSData *data = [NSData dataWithContentsOfURL:url];

    UIImage *image = [UIImage imageWithData:data];

    XCTAssertNotNil(data);
    XCTAssertNotNil(image);
}

- (void)testURLComponents {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] init];
    urlComponents.scheme = @"https";
    urlComponents.host = @"bookflow.ru";
    urlComponents.path = @"/wp-content/uploads/2017/11/Objective-C.png";
    urlComponents.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"token" value:@"123456"],
        [NSURLQueryItem queryItemWithName:@"platform" value:@"iOS"]
    ];

    NSURL *url = [urlComponents URL];
    NSLog(@"%@", url);
}

@end
