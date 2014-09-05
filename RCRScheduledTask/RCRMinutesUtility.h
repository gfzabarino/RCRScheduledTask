//
//  RCRMinutesUtility.h
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSInteger const SecondsInAMinute;

/**
 A simple class for working with minutes.
 */
@interface RCRMinutesUtility : NSObject

/**
 Returns the minute component of the current time.
 */
- (NSNumber *)currentMinute;

/**
 Returns an <tt>NSDate</tt> representing the date and time at the start of the next minute.
 */
- (NSDate *)dateAtStartOfNextMinute;

@end
