//
//  RCRScheduleStringParser.m
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRScheduleStringParser.h"

static NSInteger const MinutesInAnHour = 60;

@implementation RCRScheduleStringParser

- (NSOrderedSet *)minutesFromScheduleString:(NSString *)scheduleString {
    NSString *sanitizedString = [self sanitizedScheduleString:scheduleString];
    
    // The ordering of the following IFs is important to ensure we parse the schedule string correctly
    
    if ([sanitizedString containsString:@"*/"]) {
        return [self parseAsteriskSlashBasedScheduleString:sanitizedString];
    }
    else if ([sanitizedString containsString:@"*"]) {
        return [self parseAsteriskBasedScheduleString:sanitizedString];
    }
    else if ([sanitizedString containsString:@","]) {
        return [self parseCommaBasedScheduleString:sanitizedString];
    }
    else {
        return [self parseSingleNumberBasedScheduleString:sanitizedString];
    }
}

#pragma mark - Schedule string sanitization

- (NSString *)sanitizedScheduleString:(NSString *)scheduleString {
    // For now, simply remove all spaces (from everywhere in the string)
    return [scheduleString stringByReplacingOccurrencesOfString:@" " withString:@""];
}

#pragma mark - Schedule parsing

- (NSOrderedSet *)parseAsteriskSlashBasedScheduleString:(NSString *)scheduleString {
    // We're running every 'x' minutes - let's find out what x is by getting removing the "*/" from the string seeing what's left behind
    
    NSString *minuteIntervalString = [scheduleString stringByReplacingOccurrencesOfString:@"*/" withString:@""];
    
    NSNumber *minuteInterval = [self minuteNumberFromString:minuteIntervalString];
    
    NSMutableArray *minutes = [[NSMutableArray alloc] init];
    
    if (minuteInterval) {
        NSInteger minuteIntervalInteger = [minuteInterval integerValue];
        
        // If minuteInterval is zero then we do nothing, as to do something "every 0 minutes" makes no sense
        if (minuteIntervalInteger > 0) {
            for (NSInteger minute = 0; minute < MinutesInAnHour; minute++) {
                
                // Note that the following will always be true for minute 0, so "*/" schedules always include minute 0
                if (minute % minuteIntervalInteger == 0) {
                    [minutes addObject:@(minute)];
                }
            }
        }
    }

    return [NSOrderedSet orderedSetWithArray:minutes];
}

- (NSOrderedSet *)parseAsteriskBasedScheduleString:(NSString *)scheduleString {
    // This method is called if the string contains a '*' but isn't a '*/' type string - so we just assume a single asterisk, and that the string represents every single minute
    
    NSMutableArray *minutes = [[NSMutableArray alloc] initWithCapacity:MinutesInAnHour];
    
    for (NSInteger minute = 0; minute < MinutesInAnHour; minute++) {
        [minutes addObject:@(minute)];
    }
    
    return [NSOrderedSet orderedSetWithArray:minutes];
}

- (NSOrderedSet *)parseCommaBasedScheduleString:(NSString *)scheduleString {
    NSArray *minuteStrings = [scheduleString componentsSeparatedByString:@","];

    NSMutableArray *minutes = [[NSMutableArray alloc] initWithCapacity:[minuteStrings count]];
    
    for (NSString *minuteString in minuteStrings) {
        NSNumber *minute = [self minuteNumberFromString:minuteString];
        
        if (minute) {
            [minutes addObject:minute];
        }
    }
    
    return [NSOrderedSet orderedSetWithArray:minutes];
}

- (NSOrderedSet *)parseSingleNumberBasedScheduleString:(NSString *)scheduleString {
    return [NSOrderedSet orderedSetWithObject:[self minuteNumberFromString:scheduleString]];
}

#pragma mark - Basic string-number parsing

- (NSNumber *)minuteNumberFromString:(NSString *)string {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

    // We'll get nil if we don't have a valid number, which is what we want (unlike NSString's integerValue method, which returns 0)
    NSNumber *parsedNumber = [numberFormatter numberFromString:string];
    
    // We want this class to ignore negative numbers and also ignore numbers greater than 59, so we explicitly test for this and return nil
    NSNumber *number = nil;
    
    if (parsedNumber) {
        NSInteger parsedInteger = [parsedNumber integerValue];
        
        if (parsedInteger >= 0 && parsedInteger < MinutesInAnHour) {
            number = parsedNumber;
        }
    }
    
    return number;
}

@end
