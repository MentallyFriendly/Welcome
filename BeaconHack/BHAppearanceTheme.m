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

+(void)applyTheme
{
    [[UIView appearance] setBackgroundColor:backgroundColor()];
}

@end
