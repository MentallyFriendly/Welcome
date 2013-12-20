//
//  Created by Michael May on 20/12/2013.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "BHAppearanceTheme.h"

@implementation BHAppearanceTheme

NS_INLINE UIColor* UIColorFromRGB(NSUInteger rgbValue)
{
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0f
                           green:((float)((rgbValue & 0xFF00) >> 8))/255.0f
                            blue:((float)(rgbValue & 0xFF))/255.0f
                           alpha:1.0f];
}

NS_INLINE UIColor* backgroundColor()
{
    return UIColorFromRGB(0xf5d500);
}

NS_INLINE UIColor* tintColor()
{
    return UIColorFromRGB(0x000000);
}

+(void)applyTheme
{
    [[UIButton appearance] setTintColor:tintColor()];
    [[UIBarButtonItem appearance] setTintColor:tintColor()];
    [[UIView appearance] setBackgroundColor:backgroundColor()];
}

#pragma mark - 

+(NSString*)greetingByTimeOfDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH"];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:date];
    NSInteger hour = [components hour];

    if(hour >= 6 && hour  < 12) {
        return @"Good Morning";
    }
    
    if(hour >= 12 && hour < 18) {
        return @"Good Afternoon";
    }
    
    if(hour >= 18 && hour < 22) {
        return @"Good Evening";
    }
    
    if(hour >= 22 && hour < 23) {
        return @"Good Night";
    }
    
    return @"Up so late?";
}

@end
