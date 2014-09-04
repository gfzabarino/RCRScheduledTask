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

#pragma mark - Tests for */ based strings

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

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString5 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(30)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/30"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString6 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(30)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"* /30"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString7 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(30)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@" * / 30 "]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString8 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    NSOrderedSet *expected = [NSOrderedSet orderedSet];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/0"], @"*/0 should result in an empty set");
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString9 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSMutableArray *expectedValues = [NSMutableArray arrayWithCapacity:MinutesInAnHour];
    for (NSInteger minute = 0; minute < MinutesInAnHour; minute++) {
        [expectedValues addObject:@(minute)];
    }
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/1"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString10 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(27), @(54)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/27"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString11 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(45)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/45"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString12 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0
    NSArray *expectedValues = @[@(0), @(59)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/59"]);
}

- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString13 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];

    // */ schedules always include minute 0 - UNLESS the format string makes no sense (in this case 60 is too high)
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];

    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/60"]);
}
    
- (void)testMinutesFromScheduleStringWithTypicalAsteriskSlashBasedString14 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    // */ schedules always include minute 0 - UNLESS the format string makes no sense (in this case 1000 is far too high)
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*/1000"]);
}

#pragma mark - Tests for * based strings

- (void)testMinutesFromScheduleStringWithAsteriskBasedString {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSMutableArray *expectedValues = [NSMutableArray arrayWithCapacity:MinutesInAnHour];
    for (NSInteger minute = 0; minute < MinutesInAnHour; minute++) {
        [expectedValues addObject:@(minute)];
    }
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"*"]);
}

#pragma mark - Tests for comma based strings

- (void)testMinutesFromScheduleStringWithCommaBasedString1 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(1)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"1,"]);
}

- (void)testMinutesFromScheduleStringWithCommaBasedString2 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(1)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@",1"]);
}

- (void)testMinutesFromScheduleStringWithCommaBasedString3 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(0), @(10), @(30), @(45)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"0,10,30,45"]);
}

- (void)testMinutesFromScheduleStringWithCommaBasedString4 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(0), @(10), @(30), @(45)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@" 0,  10,   30, 45   "]);
}

- (void)testMinutesFromScheduleStringWithCommaBasedString5 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(0), @(10), @(20), @(30), @(40), @(50)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"0,10,20,30,40,50"]);
}

- (void)testMinutesFromScheduleStringWithCommaBasedString6 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(0), @(10), @(20), @(30), @(40), @(50)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@" 0  ,10, 20,30  ,40 , 50, 60  "]);
}

#pragma mark - Tests for single number based strings

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

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString4 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[@(59)];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"59"]);
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString5 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"60"]);
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString6 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"100"]);
}

- (void)testMinutesFromScheduleStringWithSingleNumberBasedString7 {
    RCRScheduleStringParser *parser = [[RCRScheduleStringParser alloc] init];
    
    NSArray *expectedValues = @[];
    
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:expectedValues];
    
    XCTAssertEqualObjects(expected, [parser minutesFromScheduleString:@"-1"]);
}

@end
