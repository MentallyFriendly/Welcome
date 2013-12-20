//
//  DataManager.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+(void)loadData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [[Model sharedInstance] setFirstname:[defaults objectForKey:FIRSTNAME_KEY]];
    [[Model sharedInstance] setLastname:[defaults objectForKey:LASTNAME_KEY]];
    
    if([defaults objectForKey:ISINITIAL_KEY] == nil) {
        [[Model sharedInstance] setIsInitialStartUp:YES];
    } else {
        [[Model sharedInstance] setIsInitialStartUp:[[defaults objectForKey:ISINITIAL_KEY] boolValue]];
    }
    
    [[Model sharedInstance] setBeaconId:[[defaults objectForKey:BEACONID_KEY] intValue]];
}

+(void)saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[Model sharedInstance].firstname forKey:FIRSTNAME_KEY];
    [defaults setObject:[Model sharedInstance].lastname forKey:LASTNAME_KEY];
    [defaults setInteger:[Model sharedInstance].beaconId forKey:BEACONID_KEY];
    [defaults setObject:@([Model sharedInstance].isInitialStartUp) forKey:ISINITIAL_KEY];
    [defaults synchronize];
}

@end
