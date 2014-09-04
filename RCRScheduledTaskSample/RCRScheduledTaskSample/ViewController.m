//
//  ViewController.m
//  RCRScheduledTaskSample
//
//  Created by Rich Robinson on 04/09/2014.
//  Copyright (c) 2014 Rich Robinson. All rights reserved.
//

#import "ViewController.h"

#import "RCRScheduledTask.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@property (nonatomic, strong) RCRScheduledTask *scheduledTask1;
@property (nonatomic, strong) RCRScheduledTask *scheduledTask2;
@property (nonatomic, strong) RCRScheduledTask *scheduledTask3;
@property (nonatomic, strong) RCRScheduledTask *scheduledTask4;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    // Output an initial welcome message
    [self logText:@"Our 4 scheduled tasks will log messages below..."];
    
    // Set up some scheduled tasks that demonstrate running tasks using each of the available schedule string types
    
    self.scheduledTask1 = [RCRScheduledTask scheduledTaskWithScheduleString:@"*" block:^{
        [self logText:@"I'm scheduled task 1! I run every minute"];
    }];
    
    self.scheduledTask2 = [RCRScheduledTask scheduledTaskWithScheduleString:@"*/5" block:^{
        [self logText:@"I'm scheduled task 2! I run every 5 minutes from the start of every hour"];
    }];
    
    self.scheduledTask3 = [RCRScheduledTask scheduledTaskWithScheduleString:@"10,20,40" block:^{
        [self logText:@"I'm scheduled task 3! I run 10, 20, and 40 minutes past every hour"];
    }];
    
    self.scheduledTask4 = [RCRScheduledTask scheduledTaskWithScheduleString:@"15" block:^{
        [self logText:@"I'm scheduled task 4! I run 15 minutes past every hour"];
    }];
}

// A simple method to log some text to our logTextView
- (void)logText:(NSString *)text
{
    NSString *dateTime = [NSDateFormatter localizedStringFromDate:[NSDate date] dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];

    NSString *fullLogText = [NSString stringWithFormat:@"%@\t%@\n", dateTime, text];

    // Ensure we update the UI from the main queue
    dispatch_async(dispatch_get_main_queue(), ^{
        self.logTextView.text = [self.logTextView.text stringByAppendingString:fullLogText];
        
        [self.logTextView scrollRangeToVisible:NSMakeRange([self.logTextView.text length], 0)];
    });
}

@end
