
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
    
    // RUN THAT SHIT FOR 30 MINUTES...
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
    
    /* COUNTER CODE... */
    
    self.count = 0;
    
    self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
    
    self.counterTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        // WILL THIS CONTINUE THE COUNTUP???
        
        if (self.count >= 590) {
         
            self.theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countUp) userInfo:nil repeats:YES];
        
        }
        
    }];
    
    // Do any additional setup after loading the view, typically from a nib.

    // THIS WILL ONLY OCCUR WHEN THE APP IS IN THE BACKGROUND...
    
    // THIS IS BECAUSE IT'S A BACKGROUND/MULTITASKING SPECIFIC PROCESS (IT'S A MOTHER FUCKING DAEMON)...
    
    /* NOTIFICATION CODE...(PUSH NOTIFICATION...) */
    
    UILocalNotification *futureAlert;
    
    futureAlert = [[UILocalNotification alloc] init];
    
    // BE VERY AWARE OF THESE METHODS...
    
    [futureAlert setAlertBody:@"24Xcode Bitch..."];
    
    // [futureAlert setSoundName:<#(NSString *)#>];
    
    futureAlert.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    futureAlert.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification: futureAlert];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
