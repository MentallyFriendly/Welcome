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
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"WELCOME" message:[NSString stringWithFormat:@"HEY %@, ENJOY YOUR STAY AT MENTALLY FRIENDLY", [[Model sharedInstance].firstname uppercaseString]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
