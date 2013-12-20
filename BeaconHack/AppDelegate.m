//
//  AppDelegate.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

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
  
}

@end
