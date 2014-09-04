//
//  RCRScheduledTask.h
//
//  Created by Rich Robinson on 03/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A class representing a scheduled task: essentially a block of code that runs on a repeating schedule based on minutes (e.g. "every 5 minutes", or "at the start of every hour").

 Important: note that scheduled tasks will only execute while your app is running in the foreground.
 */
@interface RCRScheduledTask : NSObject

/**
 A cron-like schedule string for minutes only, representing the schedule on which this task should run.
 */
@property (nonatomic, readonly) NSString *scheduleString;

/**
 The date/time the task's block was last run.
 */
@property (nonatomic, readonly, strong) NSDate *lastExecuted;

/**
 Initializes a new scheduled task.

 Cron-like schedule strings are used to specify the schedule on which the task runs (but note that this class currently caters for minutes only - which is the most likely use case for iOS apps, as they are generally not long-running and are often backgrounded and dormant).
 
 A few examples of schedule strings might be:
 
 Run on the hour (i.e. minute zero): <tt>0</tt>

 Run on the hour and at half past: <tt>0,30</tt>

 Run every 10 minutes from the start of the hour: <tt>0,10,20,30,40,50</tt>

 Run every 5 minutes (from the start of the hour): <tt>* /5</tt>

 Run every minute: <tt>*</tt>

 Note that there is a difference in behaviour in the case of <tt>"* /"</tt> schedule strings

 Also note that no special checking for invalid syntax is catered for, and that only string syntaxes as illustrated above are catered for (see <tt>RCRScheduleStringParser</tt> for more details). Invalid strings will result in the task running with the wrong schedule, or not running at all.
 
 @param scheduleString A cron-like schedule string for minutes only, specifying when the task should run.
 @param block The block of code to run at the time the task is scheduled for.
 */
- (instancetype)initWithScheduleString:(NSString *)scheduleString block:(void (^) ())block NS_DESIGNATED_INITIALIZER;

/**
 Returns a newly-initialized scheduled task. See <tt>initWithScheduleString:block:</tt> for details.
 */
+ (instancetype)scheduledTaskWithScheduleString:(NSString *)scheduleString block:(void (^) ())block;

/**
 Executes the task's block of code immediately. Note that this has no effect on the subsequent schedule, and the task will run again when it is next scheduled to.
 */
- (void)executeNow;

@end
