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

static NSInteger const MinutesInAnHour = 60;

@interface RCRScheduleStringParserTestCase : XCTestCase

@end

@implementation RCRScheduleStringParserTestCase

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString1 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(5), @(10), @(15), @(20), @(25), @(30), @(35), @(40), @(45), @(50), @(55)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/5"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString2 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(10), @(20), @(30), @(40), @(50)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/10"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString3 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(15), @(30), @(45)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/15"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString4 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(20), @(40)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/20"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString5{
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(30)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/30"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString1 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    NSOrderedSet *expected = [NSOrderedSet orderedSet];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/0"], @"*/0 should result in an empty set");
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString2 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSMutableArray *expectedValues = [NSMutableArray arrayWithCapacity:MinutesInAnHour];
    for (NSInteger minute = 0; minute < MinutesInAnHour; minute++) {
        [expectedValues addObject:@(minute)];
    }
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/1"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString3 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(27), @(54)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/27"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString4 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(45)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/45"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString5 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(59)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/59"]);
}

- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString6 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    // */ schedules always include minute 0 - UNLESS the format string makes no sense (in this case 60 is too high)
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];

    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/60"]);
}
    
- (void)testMinutesFromScheduleStringWithUnusualAsteriskSlashBasedString7 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0 - UNLESS the format string makes no sense (in this case 1000 is far too high)
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/1000"]);
}

- (void)testMinutesFromScheduleStringWithAsteriskBasedString {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSMutableArray *expectedValues = [NSMutableArray arrayWithCapacity:MinutesInAnHour];
    for (NSInteger minute = 0; minute < MinutesInAnHour; minute++) {
        [expectedValues addObject:@(minute)];
    }
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*"]);
}

- (void)testMinutesFromScheduleStringWithCommaBasedString {
    //    - (NSOrderedSet *)minutesFromScheduleString:(NSString *)scheduleString;
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString1 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(0)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"0"]);
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString2 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(17)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"17"]);
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString3 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(45)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"45"]);
}

@end
