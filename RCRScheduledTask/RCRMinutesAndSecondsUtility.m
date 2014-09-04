//
//  RCRMinutesAndSecondsUtility.m
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRMinutesAndSecondsUtility.h"

NSInteger const SecondsInAMinute = 60;

static NSInteger const SecondsInHalfAMinute = SecondsInAMinute/2;

@implementation RCRMinutesAndSecondsUtility

- (NSNumber *)currentMinute {
    // Note that sometimes our timer will fire very slightly early, and we may still be at the end of our current minute, rather than at the very end of the next minute. As such, this definition of "current minute" rounds to the nearest minute, rather than using the exact minute value of the current time.
    
    NSDate *now = [NSDate date];
    NSInteger nowSeconds = [[NSCalendar currentCalendar] components:NSSecondCalendarUnit fromDate:now].second;
    
    NSDate *nowRoundedToNearestMinute;
    
    if (nowSeconds > SecondsInHalfAMinute) {
        nowRoundedToNearestMinute = [now dateByAddingTimeInterval:(SecondsInAMinute - nowSeconds)];
    }
    else {
        nowRoundedToNearestMinute = [now dateByAddingTimeInterval:(-nowSeconds)];
    }
    
    NSDateComponents *nowRoundedToNearestMinuteComponents = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:nowRoundedToNearestMinute];
    
    return @(nowRoundedToNearestMinuteComponents.minute);
}

- (NSDate *)startOfNextMinute {
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval startOfCurrentMinute = timestamp - fmod(timestamp, 60);
    NSTimeInterval startOfNextMinute = startOfCurrentMinute + 60;
    
    return [NSDate dateWithTimeIntervalSince1970:startOfNextMinute];
}

@end
