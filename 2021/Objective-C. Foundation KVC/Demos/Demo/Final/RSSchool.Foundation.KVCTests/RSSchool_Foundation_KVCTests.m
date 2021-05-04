//
//  RSSchool_Foundation_KVCTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 28.04.21.
//

#import <XCTest/XCTest.h>
#import "RSDevice.h"

@interface RSSchool_Foundation_KVCTests : XCTestCase
@property (nonatomic, strong) RSDevice *firstDevice;
@property (nonatomic, strong) RSDevice *secondDevice;
@end

@implementation RSSchool_Foundation_KVCTests

- (void)setUp {
    self.firstDevice = [[RSDevice alloc] init];
    self.secondDevice = [[RSDevice alloc] init];
}

- (void)tearDown {
    self.firstDevice = nil;
    self.secondDevice = nil;
}

- (void)testDevicesEqualityWhenObjectsAreNotTheSame {
    NSLog(@"%@", self.firstDevice);
    NSLog(@"%@", self.secondDevice);

    XCTAssertFalse([self.firstDevice isEqual:self.secondDevice]);
}

- (void)testObjectEqualityWhenObjectsAreSame {
    self.secondDevice = self.firstDevice;

    NSLog(@"%@", self.firstDevice);
    NSLog(@"%@", self.secondDevice);

    XCTAssertTrue([self.firstDevice isEqual:self.secondDevice]);
}

- (void)testObjectEqualityWhenObjectsHaveEqualPropertyValues {
    self.firstDevice.name = @"iPhone 7";
    self.secondDevice.name = @"iPhone 7";

    self.firstDevice.capacity = @32;
    self.secondDevice.capacity = @32;

    NSLog(@"%@", self.firstDevice);
    NSLog(@"%@", self.secondDevice);

    XCTAssertTrue([self.firstDevice isEqual:self.secondDevice]);
}

- (void)testHashValues {
    self.firstDevice.name = @"iPhone 7";
    self.secondDevice.name = @"iPhone 7";

    self.firstDevice.capacity = @32;
    self.secondDevice.capacity = @32;

    NSUInteger firstDeviceHash = self.firstDevice.hash;
    NSUInteger secondDeviceHash = self.secondDevice.hash;

    XCTAssertEqual(firstDeviceHash, secondDeviceHash);
}

- (void)testPerfomSelector {
    SEL deviceSelectorFromString = NSSelectorFromString(@"setName:capacity:");

    self.firstDevice.name = @"iPhone 7";
    self.firstDevice.capacity = @32;

    NSLog(@"%@", self.firstDevice.name);
    NSLog(@"%@", self.firstDevice.capacity);

    [self.firstDevice performSelector:deviceSelectorFromString withObject:@"iPhone 8" withObject:@64];

    NSLog(@"%@", self.firstDevice.name);
    NSLog(@"%@", self.firstDevice.capacity);
}

@end
