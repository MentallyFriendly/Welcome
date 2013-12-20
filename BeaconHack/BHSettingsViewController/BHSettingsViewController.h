//
//  Created by Michael May on 20/12/2013.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHSettingsStorageProtocol
@property (nonatomic, copy) NSString *proximityUUID;
@property (nonatomic, strong) NSNumber *majorNumber;
@property (nonatomic, readonly, strong) NSString *majorNumberValue;

@property (nonatomic, strong) NSNumber *minorNumber;
@property (nonatomic, readonly, strong) NSString *minorNumberValue;
@end

@interface BHSettingsViewController : UIViewController

@end
