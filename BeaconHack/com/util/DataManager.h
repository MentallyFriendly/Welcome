//
//  DataManager.h
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#define FIRSTNAME_KEY @"firstname"
#define LASTNAME_KEY @"lastname"
#define BEACONID_KEY @"beaconid"
#define ISINITIAL_KEY @"isinitial"

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+(void)loadData;
+(void)saveData;



@end
