//
//  RCRScheduleStringParser.h
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Parses schedule strings as used by <tt>RCRScheduledTask</tt>.
 */
@interface RCRScheduleStringParser : NSObject

/**
 Given a schedule string (consisting of minutes only), returns a set containing the minutes it represents.

 The following schedule string syntaxes are supported:

 Every minute: <tt>*</tt>

 Every 5 minutes (from the start of the hour): <tt>* /5</tt>

 At minutes 0, 5, 10, and 15: <tt>0,5,10,15</tt>

 At minute 5: <tt>5</tt>

 (Where 0, 5, 10 and 15 are arbitrary minute numbers.)

 Note that this method does no special checking for unusual/invalid syntax - it will simply ignore anything that's not valid and return a set with items missing (or a completely empty set).

 @param scheduleString A cron-like schedule string containing minutes only.
 @return An <tt>NSOrderedSet</tt> containing an <tt>NSNumber</tt> for each minute in the schedule string.
 */
- (NSOrderedSet *)minutesFromScheduleString:(NSString *)scheduleString;

@end
