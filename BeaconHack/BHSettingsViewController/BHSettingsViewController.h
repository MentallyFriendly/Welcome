//
//  Created by Michael May on 20/12/2013.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BHSettingsStorageProtocol
@required
@property (nonatomic, copy) NSString *proximityUUID;
@property (nonatomic, strong) NSNumber *majorNumber;
@property (nonatomic, copy) NSString *majorNumberValue;
@property (nonatomic, strong) NSNumber *minorNumber;
@property (nonatomic, copy) NSString *minorNumberValue;
@end

@interface BHSettingsViewController : UIViewController

+(instancetype)settingsViewControllerWithStorage:(id<BHSettingsStorageProtocol>)storage;

@end
