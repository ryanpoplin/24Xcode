
//
//  ViewController.m
//  24Xcode
//
//  Created by Byrdann Fox on 6/26/14.
//  Copyright (c) 2014 ExcepApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



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
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
