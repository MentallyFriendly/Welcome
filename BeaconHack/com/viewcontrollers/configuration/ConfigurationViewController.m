//
//  ConfigurationViewController.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "ConfigurationViewController.h"

#import "BHSettingsViewController.h"

@interface ConfigurationViewController ()

@end

@implementation ConfigurationViewController

#pragma mark -

-(void)addSettingsButton
{
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                    target:self
                                                                                    action:@selector(userDidTapSettingsButton)];
    [[self navigationItem] setRightBarButtonItem:settingsButton animated:NO];    
}

-(void)userDidTapSettingsButton
{
    BHSettingsViewController *settingsViewController = [BHSettingsViewController settingsViewControllerWithStorage:nil];
 
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
    
    [self presentViewController:navigationController
                       animated:YES
                     completion:nil];
}

#pragma mark -

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

    [self addSettingsButton];
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
    [[Model sharedInstance] setIsInitialStartUp:NO];
    
    [DataManager saveData];
    
    UIViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
    [self presentViewController:controller animated:YES completion:nil];
}

@end
