RCRScheduledTask
================

A simple facility for running scheduled, repeating tasks within an iOS app using cron-like strings for minutes.

## What it Depends on

`RCRScheduledTask` depends on Xcode 6 and higher and has been tested with iOS 7 and iOS 8.

All code uses ARC.

## How to Use it

First, add the `RCRScheduledTask` folder and code to your project.

Then, one way to quickly setup a scheduled task from a view controller would be as follows.

Import `RCRScheduledTask.h` into your view controller:

```objc
#import "RCRScheduledTask.h"
```

Next, add a property for a scheduled task:

```objc
@property (nonatomic, strong) RCRScheduledTask *scheduledTask;
```

Then, in your `viewDidLoad` method, initialize the scheduled task, passing it a schedule string, and a block of code to call according to the schedule. For example:

```objc
self.scheduledTask = [RCRScheduledTask scheduledTaskWithScheduleString:@"*" block:^{
    NSLog(@"I’m a scheduled task! I run every minute");
}];
```

## Sample Project

A sample project containing several examples of scheduled tasks, along with unit tests for `RCRScheduledTask`, can be found in the `RCRScheduledTaskSample` folder.

## License

MIT License (see `LICENSE` in the root of the repository).