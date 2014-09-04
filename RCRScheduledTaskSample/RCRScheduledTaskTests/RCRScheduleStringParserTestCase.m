//
//  RCRScheduleStringParserTestCase.m
//  RCRScheduledTaskSample
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "RCRScheduleStringParser.h"

@interface RCRScheduleStringParserTestCase : XCTestCase

@end

@implementation RCRScheduleStringParserTestCase

// @@TODO@@:
//- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedStrings {
//    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
//
//    [parser minutesFromScheduleString:@"*/5"];
//    [parser minutesFromScheduleString:@"*/10"];
//    [parser minutesFromScheduleString:@"*/15"];
//    [parser minutesFromScheduleString:@"*/20"];
//    [parser minutesFromScheduleString:@"*/30"];
//}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString1 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    NSOrderedSet *expected = [NSOrderedSet orderedSet];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/0"], @"*/0 should result in an empty set");
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString2 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[]; // @@TODO@@ update
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/1"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString3 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    NSArray *expectedValues = @[]; // @@TODO@@ update
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/27"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString4 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[]; // @@TODO@@ update
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/45"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString5 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];

    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/60"]);
}
    
- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString6 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSet];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/1000"]);
}

- (void)testMinutesFromScheduleStringWithAsteriskBasedString {
    //    - (NSOrderedSet *)minutesFromScheduleString:(NSString *)scheduleString;
}

- (void)testMinutesFromScheduleStringWithCommaBasedString {
    //    - (NSOrderedSet *)minutesFromScheduleString:(NSString *)scheduleString;
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString {
    //    - (NSOrderedSet *)minutesFromScheduleString:(NSString *)scheduleString;
}

@end
