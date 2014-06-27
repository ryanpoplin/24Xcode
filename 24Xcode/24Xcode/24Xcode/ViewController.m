
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

-(void)countUp;

@end

@implementation ViewController

-(void)countUp {
    
    if (self.count == 1800) {
        
        [self.theTimer invalidate];
        
        self.theTimer = nil;
        
        [[UIApplication sharedApplication] endBackgroundTask:self.counterTask];
    
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
    
    self.count = 0;
    
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
    
    UILocalNotification *futureAlert;
    
    futureAlert = [[UILocalNotification alloc] init];
    
    [futureAlert setAlertBody:@"Almost 10 minutes bitch boy..."];
    
    // [futureAlert setSoundName:<#(NSString *)#>];
    
    futureAlert.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    futureAlert.timeZone = [NSTimeZone defaultTimeZone];
    
    if (self.count >= 590) {
        
        [[UIApplication sharedApplication] scheduleLocalNotification: futureAlert];
        
    }
    
    self.counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        if (self.count >= 590) {
            
            self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
        
        }
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
