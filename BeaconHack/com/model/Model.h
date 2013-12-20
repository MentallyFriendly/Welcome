//
//  Model.h
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BHSettingsViewController.h"

@interface Model : NSObject <BHSettingsStorageProtocol>

@property (nonatomic, assign) BOOL isInitialStartUp;
@property (nonatomic, retain) NSString* firstname;
@property (nonatomic, retain) NSString* lastname;

@property (nonatomic, copy) NSString *proximityUUID;
@property (nonatomic, strong) NSNumber *majorNumber;
@property (nonatomic, copy) NSString *majorNumberValue;
@property (nonatomic, strong) NSNumber *minorNumber;
@property (nonatomic, copy) NSString *minorNumberValue;

+ (Model*) sharedInstance;

@end
