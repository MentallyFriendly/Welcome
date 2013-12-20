//
//  DataManager.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

static NSString *BHProximityUUIDKey = @"BHProximityUUIDKey";
static NSString *BHMajorNumberKey = @"BHMajorNumberKey";
static NSString *BHMinorNumberKey = @"BHMinorNumberKey";

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
    
    NSString *proximityUUID = [[NSUserDefaults standardUserDefaults] objectForKey:BHProximityUUIDKey];
    if(proximityUUID) [[Model sharedInstance] setProximityUUID:proximityUUID];
    
    NSNumber *majorNumber = [[NSUserDefaults standardUserDefaults] objectForKey:BHMajorNumberKey];
    if(majorNumber) [[Model sharedInstance] setMajorNumber:majorNumber];

    NSNumber *minorNumber = [[NSUserDefaults standardUserDefaults] objectForKey:BHMinorNumberKey];
    if(minorNumber) [[Model sharedInstance] setMinorNumber:minorNumber];
}

+(void)saveData
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[Model sharedInstance].firstname forKey:FIRSTNAME_KEY];
    [defaults setObject:[Model sharedInstance].lastname forKey:LASTNAME_KEY];
    [defaults setObject:@([Model sharedInstance].isInitialStartUp) forKey:ISINITIAL_KEY];
    
    {
        NSString *proximityUUID = [[Model sharedInstance] proximityUUID];
        if(proximityUUID) {
            [[NSUserDefaults standardUserDefaults] setObject:proximityUUID forKey:BHProximityUUIDKey];
        } else {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:BHProximityUUIDKey];
        }
    }

    {
        NSNumber* majorNumber = [[Model sharedInstance] majorNumber];
        if(majorNumber) {
            [[NSUserDefaults standardUserDefaults] setObject:majorNumber forKey:BHMajorNumberKey];
        } else {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:BHMajorNumberKey];
        }
    }
    
    {
        NSNumber* minorNumber = [[Model sharedInstance] minorNumber];
        if(minorNumber) {
            [[NSUserDefaults standardUserDefaults] setObject:minorNumber forKey:BHMinorNumberKey];
        } else {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:BHMinorNumberKey];
        }
    }
    
    [defaults synchronize];
}

@end
