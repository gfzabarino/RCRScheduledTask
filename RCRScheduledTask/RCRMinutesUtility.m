//
//  RCRMinutesUtility.m
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRMinutesUtility.h"

NSInteger const SecondsInAMinute = 60;

static NSTimeInterval const StartOfNextMinuteOffset = 0.02;

@implementation RCRMinutesUtility

- (NSNumber *)currentMinute {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSMinuteCalendarUnit fromDate:[NSDate date]];
    
    return @(dateComponents.minute);
}

- (NSDate *)dateAtStartOfNextMinute {
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval startOfCurrentMinute = timestamp - fmod(timestamp, SecondsInAMinute);
    
    // Note that we also add the additional 'NextMinuteOffset' to ensure we are definitely into the next minute, whilst also having a negligable effect on anything the user can measure (in practice the user will not see any difference between a minute starting at 0.00 and a minute starting at 0.02, which is the offset currently defined)
    NSTimeInterval startOfNextMinute = startOfCurrentMinute + SecondsInAMinute + StartOfNextMinuteOffset;
    
    return [NSDate dateWithTimeIntervalSince1970:startOfNextMinute];
}

@end
