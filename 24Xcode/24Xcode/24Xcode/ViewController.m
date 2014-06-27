
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

@end

@implementation ViewController
            
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.

    // THIS WILL ONLY OCCUR WHEN THE APP IS IN THE BACKGROUND...
    
    // THIS IS BECAUSE IT'S A BACKGROUND/MULTITASKING SPECIFIC PROCESS (IT'S A MOTHER FUCKING DAEMON)...
    
    UILocalNotification *futureAlert;
    
    futureAlert = [[UILocalNotification alloc] init];
    
    // BE VERY AWARE OF THESE METHODS...
    
    [futureAlert setAlertBody:@"24Xcode Bitch..."];
    
    // [futureAlert setSoundName:<#(NSString *)#>];
    
    futureAlert.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    futureAlert.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification: futureAlert];
    
    // A LONG-RUNNING BACKGROUND/DAEMON TASK...
    UIBackgroundTaskIdentifier aLongFuckingTask;
    
    aLongFuckingTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
            // 10 MIN IS ALL WE'VE GOT...
        
            // I CAN CHANGE THAT HERE...
        
            // WHERE THE FUCK DOES THIS GO?
        
            // [[UIApplication sharedApplication] endBackgroundTask:aLongFuckingTask];
        
            // SO BASICALLY THE AMOUNT OF TIME LEFT IN THE 'afterRemainder' VARIABLE NEEDS TO BE HOW LONG THIS BACKGROUND PROCESS SHOULD RUN...
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
