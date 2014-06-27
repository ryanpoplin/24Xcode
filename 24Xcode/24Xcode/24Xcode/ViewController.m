
//
//  ViewController.m
//  24Xcode
//
//  Created by Byrdann Fox on 6/26/14.
//  Copyright (c) 2014 ExcepApps. All rights reserved.
//

#import "ViewController.h"

// HERE'S A TEST PROGRAM TO TEST OUT LOCAL/PUSH NOTIFICATIONS AS WELL AS BACKGROUND PROCESSING/MULTITASKING VIA DAEMONS...

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *theCount;

@property (nonatomic) int count;

@property (nonatomic) UIBackgroundTaskIdentifier counterTask;

@property (nonatomic, weak) NSTimer *theTimer;

-(void)countUp;

@end

@implementation ViewController

UILocalNotification *futureAlert;

-(void)countUp {
    
    if (self.count == 800) {
        
        [self.theTimer invalidate];
        
        self.theTimer = nil;
        
        [[UIApplication sharedApplication] scheduleLocalNotification: futureAlert];
        
    } else {
        
        self.count++;
        
        NSString *currentCount;
        
        currentCount = [NSString stringWithFormat:@"%d", self.count];
        
        self.theCount.text = currentCount;
        
        NSLog(@"%d", self.count);
        
    }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] endBackgroundTask:self.counterTask];
    
    futureAlert = [[UILocalNotification alloc] init];
    
    [futureAlert setAlertBody:@"The Iron Yard..."];
    
    // [futureAlert setSoundName:<#(NSString *)#>];
    
    futureAlert.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    
    futureAlert.timeZone = [NSTimeZone defaultTimeZone];
    
    self.count = 0;
    
    if (self.count <= 599) {

        self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];

    }
    
    // SO THIS SHOULD TAKE CARE OF IT WITHOUT HANDLING STUFF FOR 10 MIN...?
    self.counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
