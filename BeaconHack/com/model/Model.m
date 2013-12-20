//
//  Model.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "Model.h"

@implementation Model

+ (Model*) sharedInstance
{
    static dispatch_once_t pred;
    static Model *shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[Model alloc] init];
    });
    
    return shared;
}

- (id) init
{
    self = [super init];
    if(self)
    {
        self.beaconId = 56985;
    }
    
    return self;
}


@end
