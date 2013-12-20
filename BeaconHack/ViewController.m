//
//  ViewController.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    previousState = CLProximityUnknown;
    currentState = CLProximityUnknown;
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.devfright.myRegion"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
    
    self.locationManager.activityType = CLActivityTypeFitness;
    self.locationManager.pausesLocationUpdatesAutomatically = NO;
    
    [self.locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{

}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

// CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon = nil;
    
    for (CLBeacon* b in beacons) {
        if([b.major intValue] == 56985)
        {
            beacon = b;
        }
    }
    
    if(beacon != nil)
    {
        if (beacon.proximity == CLProximityUnknown) {
            NSLog(@"Unknown Proximity");
        } else if (beacon.proximity == CLProximityImmediate) {
            NSLog(@"Immediate");
        } else if (beacon.proximity == CLProximityNear) {
            NSLog(@"Near");
            
            [self triggerWelcome];
            
        } else if (beacon.proximity == CLProximityFar) {
            NSLog(@"Far");
        }
        
        previousState = currentState;
        currentState = beacon.proximity;
    }
    else
    {
        
    }
}

-(void) triggerWelcome
{
    if(currentState != previousState)
    {
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        localNotification.alertBody = [NSString stringWithFormat:@"WELCOME %@", [[Model sharedInstance].firstname uppercaseString]];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"HELLO" message:[NSString stringWithFormat:@"WELCOME %@", [[Model sharedInstance].firstname uppercaseString]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
