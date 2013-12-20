//
//  ConfigurationViewController.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "ConfigurationViewController.h"

@interface ConfigurationViewController ()

@end

@implementation ConfigurationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.firstname becomeFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(![textField.text isEqualToString:@""] && textField == self.firstname)
    {
        [self.lastname becomeFirstResponder];
    }
    
    [textField resignFirstResponder];
    
    return NO;
}

- (IBAction)onNext:(id)sender
{
    [[Model sharedInstance] setFirstname:self.firstname.text];
    [[Model sharedInstance] setLastname:self.lastname.text];
}

@end
