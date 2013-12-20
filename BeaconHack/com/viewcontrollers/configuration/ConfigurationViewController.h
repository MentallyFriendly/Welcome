//
//  ConfigurationViewController.h
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationViewController : UIViewController <UITextFieldDelegate>
{
    
}

@property (nonatomic, weak) IBOutlet UITextField* firstname;
@property (nonatomic, weak) IBOutlet UITextField* lastname;

- (IBAction)onNext:(id)sender;

@end
