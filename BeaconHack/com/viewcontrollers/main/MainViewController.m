//
//  MainViewController.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "MainViewController.h"

#import "BHSettingsViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark -

-(IBAction)userDidTapSettingsButton:(id)sender
{
    BHSettingsViewController *settingsViewController = [BHSettingsViewController settingsViewControllerWithStorage:nil];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}

#pragma mark - 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    previousState = CLProximityUnknown;
    currentState = CLProximityUnknown;
    self.stateLabel.text = @"Unknown Proximity";
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"com.devfright.myRegion"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
    
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
        if([b.major intValue] == [Model sharedInstance].beaconId)
        {
            beacon = b;
        }
    }
    
    if(beacon != nil)
    {
        if (beacon.proximity == CLProximityUnknown) {
            self.stateLabel.text = @"UNKNOWN";
        } else if (beacon.proximity == CLProximityImmediate) {
            self.stateLabel.text = @"IMMETDIATE";
        } else if (beacon.proximity == CLProximityNear) {
            self.stateLabel.text = @"NEAR";
        } else if (beacon.proximity == CLProximityFar) {
            self.stateLabel.text = @"FAR";
        }
        
        if (beacon.proximity == CLProximityImmediate || beacon.proximity == CLProximityNear)
        {
            [self triggerWelcome];
        }
        
        previousState = currentState;
        
        if(beacon.proximity == CLProximityImmediate) {
            currentState = CLProximityNear;
        } else {
            currentState = beacon.proximity;
        }
    } else {
        self.stateLabel.text = @"UNKNOWN";
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
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"WELCOME" message:[NSString stringWithFormat:@"HEY %@, ENJOY YOUR STAY AT MENTALLY FRIENDLY", [[Model sharedInstance].firstname uppercaseString]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

@end
