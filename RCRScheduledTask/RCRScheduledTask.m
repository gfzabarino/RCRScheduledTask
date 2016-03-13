//
//  RCRScheduledTask.m
//
//  Created by Rich Robinson on 03/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRScheduledTask.h"
#import "RCRScheduleStringParser.h"
#import "RCRMinuteChangeTimer.h"

@interface RCRScheduledTask ()

@property (nonatomic, copy) void (^block) ();

@property (nonatomic, copy) NSOrderedSet *minutesOnWhichToExecute;

@property (nonatomic, strong) RCRMinuteChangeTimer *minuteChangeTimer;

@end

@implementation RCRScheduledTask

- (instancetype)initWithScheduleString:(NSString *)scheduleString block:(void (^) ())block {
    self = [super init];

    if (self) {
        _scheduleString = scheduleString;
        _block = block;
        
        _minutesOnWhichToExecute = [[[RCRScheduleStringParser alloc] init] minutesFromScheduleString:scheduleString];
        _lastExecuted = nil;

        __weak typeof(self) weakSelf = self;
        _minuteChangeTimer = [RCRMinuteChangeTimer timerWithBlock:^ (NSDate *firingDate) {
            [weakSelf timerFiredWithFiringDate:firingDate];
        }];
    }
    
    return self;
}

- (void)dealloc {
    [_minuteChangeTimer stop];
}

+ (instancetype)scheduledTaskWithScheduleString:(NSString *)scheduleString block:(void (^) ())block {
    return [[self alloc] initWithScheduleString:scheduleString block:block];
}

- (void)executeNow {
    [self execute];
}

- (void)cancel {
    [_minuteChangeTimer stop];
}

#pragma mark - Private methods

- (void)timerFiredWithFiringDate:(NSDate *)firingDate {
    NSNumber *firingMinute = [self minuteForDate:firingDate];
    
    if ([self.minutesOnWhichToExecute containsObject:firingMinute]) {
        [self execute];
    }
}

- (NSNumber *)minuteForDate:(NSDate *)date {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:date];
    
    return @(dateComponents.minute);
}

- (void)execute {
    if (self.block) {
        _lastExecuted = [NSDate date];
        self.block();
    }
}

@end
