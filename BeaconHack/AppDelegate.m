//
//  AppDelegate.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>

#import "AppDelegate.h"

#import "BHAppearanceTheme.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [BHAppearanceTheme applyTheme];
    
    [DataManager saveData];
    [DataManager loadData];

    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notif
{
    NSString *alertBody = [notif alertBody];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:alertBody
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    NSString *alertSound = [notif soundName];
    if(alertSound) {
        NSString *alertSoundName = [[alertSound pathComponents] firstObject];
        NSString *alertExtension = [alertSound pathExtension];
        SystemSoundID soundsID;
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:alertSoundName  withExtension:alertExtension];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &soundsID);
        AudioServicesPlaySystemSound(soundsID);
    }
}

@end
