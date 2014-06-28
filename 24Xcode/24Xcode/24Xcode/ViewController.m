//
//  ViewController.m
//  24Xcode
//
//  Created by Byrdann Fox on 6/26/14.
//  Copyright (c) 2014 ExcepApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *theCount;

@property (nonatomic) int count;

@property (nonatomic) UIBackgroundTaskIdentifier counterTask;

@property (nonatomic, weak) NSTimer *theTimer;

@property (nonatomic, weak) NSTimer *daemonTimer;

@property (nonatomic) UILocalNotification *futureAlert;

-(void)countUp;

@end

@implementation ViewController

-(void)countUp {
    
    if (self.count == 605) {
        
        [[UIApplication sharedApplication] scheduleLocalNotification: _futureAlert];
        
        [self.daemonTimer invalidate];
        
        self.daemonTimer = nil;
        
        [[UIApplication sharedApplication] endBackgroundTask:self.counterTask];
        
    } else {
        
        self.count++;
        
        NSString *currentCount;
        
        currentCount = [NSString stringWithFormat:@"%d", self.count];
        
        self.theCount.text = currentCount;
        
    }
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        [self.theTimer invalidate];
        
        self.theTimer = nil;
        
        self.daemonTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
        
    }];
    
    _futureAlert = [[UILocalNotification alloc] init];
    
    [_futureAlert setAlertBody:@"..."];
    
    // [futureAlert setSoundName:<#(NSString *)#>];
    
    _futureAlert.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    
    _futureAlert.timeZone = [NSTimeZone defaultTimeZone];
    
    self.count = 0;
    
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

@end