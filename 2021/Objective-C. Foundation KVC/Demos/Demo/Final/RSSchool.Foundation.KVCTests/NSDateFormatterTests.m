//
//  NSDateFormatterTests.m
//  RSSchool.Foundation.KVCTests
//
//  Created by Diana Tynkovan on 1.05.21.
//

#import <XCTest/XCTest.h>

@interface NSDateFormatterTests : XCTestCase

@end

@implementation NSDateFormatterTests

- (void)testCurrentDate {
    NSDate *currentDateNow = [NSDate now];

    NSLog(@"%@", currentDateNow);

    NSDate *currentDate = [NSDate date];

    NSLog(@"%@", currentDate);
}

- (void)testDateFormatterWithDateStyle {
    NSString *expectedString = @"Jan 2, 2001";

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    dateFormatter.timeStyle = NSDateFormatterNoStyle;

    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:118800];

    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];

    NSString *stringFromDate = [dateFormatter stringFromDate:date];
    NSLog(@"%@", stringFromDate);

    XCTAssertTrue([expectedString isEqualToString:stringFromDate]);
}

- (void)testDateFormatterWithDateFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.calendar = [NSCalendar autoupdatingCurrentCalendar];
    dateFormatter.dateFormat = @"dd MM yyyy";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    dateFormatter.timeZone = NSTimeZone.defaultTimeZone;

    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:1188000];

    NSLog(@"%@", [dateFormatter stringFromDate:date]);
}

- (void)testDateFromStringUsingDateFormatter {
    NSString *string = @"2021-05-01T18:15:43.210+03:00";
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSxxx";

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;

    NSDate *dateFromString = [dateFormatter dateFromString:string];

    NSLog(@"%@", dateFromString);

    XCTAssertNotNil(dateFromString);
}

- (void)testDateComponentsUsingCalendar {
    NSString *string = @"2021-05-01T18:15:43.210+03:00";
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSxxx";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;

    NSDate *dateFromString = [dateFormatter dateFromString:string];

    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    [calendar setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:800]];
    NSLog(@"%@",[calendar components:NSCalendarUnitDay fromDate:dateFromString]);
    NSLog(@"%@",[calendar components:NSCalendarUnitYear fromDate:dateFromString]);
    NSLog(@"%@",[calendar components:NSCalendarUnitMonth fromDate:dateFromString]);
}

- (void)testCreateDateFromDateComponentsUsingCalendar {
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:2020];
    [dateComponents setDay:12];
    [dateComponents setMonth:3];

    NSDate *dateFromDateComponents = [calendar dateFromComponents:dateComponents];
    NSLog(@"%@",dateFromDateComponents);
}

- (void)testDateConvertedBetweenTimezones {
    NSString *string = @"2021-05-01T18:15:43.210+03:00";
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSSxxx";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;

    NSDate *dateFromString = [dateFormatter dateFromString:string];
    NSLog(@"%@", dateFromString);

    NSTimeZone *toTimeZone = [NSTimeZone timeZoneWithName:@"Asia/Anadyr"];
    NSTimeZone *fromTimeZone = NSTimeZone.defaultTimeZone;
    NSDate *convertedDate = [NSDateFormatterTests convertDate:dateFromString toTimeZone:toTimeZone fromTimeZone:fromTimeZone];
    NSLog(@"%@", convertedDate);
}

+ (NSDate *)convertDate:(NSDate *)date toTimeZone:(NSTimeZone *)toTimeZone fromTimeZone:(NSTimeZone *)fromTimeZone {
    NSTimeInterval targetOffset = [toTimeZone secondsFromGMTForDate:date];
    NSTimeInterval localOffset = [fromTimeZone secondsFromGMTForDate:date];

    return [date dateByAddingTimeInterval:targetOffset - localOffset];
}

@end
