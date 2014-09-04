//
//  RCRScheduledTask.m
//
//  Created by Rich Robinson on 03/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "RCRScheduledTask.h"
#import "RCRScheduleStringParser.h"
#import "RCRMinutesAndSecondsUtility.h"

@interface RCRScheduledTask ()

@property (nonatomic, copy) void (^block) ();

@property (nonatomic, copy) NSOrderedSet *minutesOnWhichToExecute;

@property (nonatomic, strong) RCRMinutesAndSecondsUtility *minutesAndSecondsUtility;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation RCRScheduledTask

- (instancetype)initWithScheduleString:(NSString *)scheduleString block:(void (^) ())block {
    self = [super init];

    if (self) {
        _scheduleString = scheduleString;
        _block = block;
        
        _minutesOnWhichToExecute = [[[RCRScheduleStringParser alloc] init] minutesFromScheduleString:scheduleString];
        _lastExecuted = nil;

        _minutesAndSecondsUtility = [[RCRMinutesAndSecondsUtility alloc] init];
        
        // Next we configure our timer, telling it to first run at the beginning of the next minute, and then every 60 seconds thereafter
        _timer = [[NSTimer alloc] initWithFireDate:[_minutesAndSecondsUtility startOfNextMinute] interval:(NSTimeInterval)SecondsInAMinute target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];

        // Now we start the timer by adding it to the current runloop in the default mode (this is what the scheduledTimerWithTimeInterval: convenience methods of NSTimer do)
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }
    
    return self;
}

- (void)dealloc {
    // Invalidate the timer and force it to nil (setting it to nil is probably not necessary in a dealloc method but we do it explicitly to cater for the unlikely event that something attempts to use it again before this class is fully deallocated)
    [_timer invalidate];
    _timer = nil;
}

+ (instancetype)scheduledTaskWithScheduleString:(NSString *)scheduleString block:(void (^) ())block {
    return [[self alloc] initWithScheduleString:scheduleString block:block];
}

- (void)executeNow {
    [self execute];
}

#pragma mark - Private methods

- (void)timerFired:(NSTimer *)timer {
    if ([self.minutesOnWhichToExecute containsObject:[self.minutesAndSecondsUtility currentMinute]]) {
        [self execute];
    }
}

- (void)execute {
    if (self.block) {
        _lastExecuted = [NSDate date];
        self.block();
    }
}

@end
