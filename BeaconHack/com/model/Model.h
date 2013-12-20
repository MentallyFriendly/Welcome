//
//  Model.h
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
{
    
}

@property (nonatomic, retain) NSString* firstname;
@property (nonatomic, retain) NSString* lastname;

@property (nonatomic, assign) int beaconId;

+ (Model*) sharedInstance;

@end
