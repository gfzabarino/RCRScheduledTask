//
//  RCRMinutesUtility.m
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRMinutesUtility.h"

NSInteger const SecondsInAMinute = 60;

static NSInteger const SecondsInHalfAMinute = SecondsInAMinute/2;

@implementation RCRMinutesUtility

- (NSNumber *)nearestMinuteToNow {
    return [self nearestMinuteToDate:[NSDate date]];
}

- (NSNumber *)nearestMinuteToDate:(NSDate *)date {
    NSInteger seconds = [[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:date].second;
    
    NSDate *dateRoundedToNearestMinute;
    
    if (seconds > SecondsInHalfAMinute) {
        dateRoundedToNearestMinute = [date dateByAddingTimeInterval:(SecondsInAMinute - seconds)];
    }
    else {
        dateRoundedToNearestMinute = [date dateByAddingTimeInterval:(-seconds)];
    }
    
    NSDateComponents *dateRoundedToNearestMinuteComponents = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:dateRoundedToNearestMinute];
    
    return @(dateRoundedToNearestMinuteComponents.minute);
}

- (NSDate *)dateAtStartOfNextMinute {
    return [self dateAtStartOfNextMinuteForDate:[NSDate date]];
}

- (NSDate *)dateAtStartOfNextMinuteForDate:(NSDate *)date {
    NSTimeInterval timestamp = [date timeIntervalSince1970];
    NSTimeInterval startOfCurrentMinute = timestamp - fmod(timestamp, 60);
    NSTimeInterval startOfNextMinute = startOfCurrentMinute + 60;
    
    return [NSDate dateWithTimeIntervalSince1970:startOfNextMinute];
}

@end
