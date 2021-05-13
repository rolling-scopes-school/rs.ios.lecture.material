//
//  NSDataTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 1.05.21.
//

#import <XCTest/XCTest.h>
#import "JSONTestObject.h"

@interface NSDataTests : XCTestCase

@end

@implementation NSDataTests

- (void)testExample {
    NSString *jsonString = @"{\"testIdentifier\": \"1djdf4jfks5\"}";
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    JSONTestObject *testObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"%@", testObject);
}

@end
