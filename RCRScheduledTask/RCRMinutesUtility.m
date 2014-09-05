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
    
    // Note that we also add the additional 'StartOfNextMinuteOffset' to ensure we are definitely 'well' into the next minute. This helps eliminate any timing errors that come from sometimes being a few thousandths of seconds either side of it - for example, with RCRScheduledTask we would often see that tasks would fire in the last few thousandths of a second of the minute before they were due to fire (and hence the minute number would be one too low when they did). Doing this will have a negligable effect on anything the user can measure - i.e. in practice the user will not see any difference between a minute starting at 0.00s and a minute starting at 0.02s, which is the offset currently defined
    
    NSTimeInterval startOfNextMinute = startOfCurrentMinute + SecondsInAMinute + StartOfNextMinuteOffset;
    
    return [NSDate dateWithTimeIntervalSince1970:startOfNextMinute];
}

@end
