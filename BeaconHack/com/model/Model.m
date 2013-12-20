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
        self.isInitialStartUp = YES;
        self.proximityUUID = @"B9407F30-F5F8-466E-AFF9-25556B57FE6D";
        self.majorNumber = @1234;
        self.minorNumber = @12345;
    }
    
    return self;
}

#pragma mark - BHSettingsStorageProtocol

-(NSString*)majorNumberValue
{
    NSNumber *majorNumber = [self majorNumber];
    
    if(majorNumber) {
        return [majorNumber stringValue];
    }
    
    return @"";
}

-(void)setMajorNumberValue:(NSString *)majorNumberValue
{
    NSNumber *majorNumber = nil;
    
    if(majorNumberValue) {
        majorNumber = [NSNumber numberWithInt:[majorNumberValue intValue]];
    }
    
    [self setMajorNumber:majorNumber];
}

#pragma mark minor number values

-(NSString*)minorNumberValue
{
    NSNumber *minorNumber = [self minorNumber];
    
    if(minorNumber) {
        return [minorNumber stringValue];
    }
    
    return @"";
}

-(void)setMinorNumberValue:(NSString *)minorNumberValue
{
    NSNumber *minorNumber = nil;
    
    if(minorNumberValue) {
        minorNumber = [NSNumber numberWithInt:[minorNumberValue intValue]];
    }
    
    [self setMinorNumber:minorNumber];
}

@end
