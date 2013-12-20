//
//  Created by Michael May on 20/12/2013.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "BHSettingsViewController.h"

@interface BHSettingsViewController ()
@property (strong, nonatomic) id<BHSettingsStorageProtocol> storage;
@property (weak, nonatomic) IBOutlet UITextField *proximityUUID;
@property (weak, nonatomic) IBOutlet UITextField *majorNumber;
@property (weak, nonatomic) IBOutlet UITextField *minorNumber;
@end

@implementation BHSettingsViewController

#pragma mark - 

-(void)userDidTapDoneButton
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
    
    id<BHSettingsStorageProtocol> storage = [self storage];
    [storage setProximityUUID:[[self proximityUUID] text]];
    [storage setMajorNumberValue:[[self majorNumber] text]];
    [storage setMinorNumberValue:[[self minorNumber] text]];
}

-(void)userDidTapCancelButton
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(userDidTapDoneButton)];
    [[self navigationItem] setRightBarButtonItem:doneButton animated:NO];

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(userDidTapCancelButton)];
    [[self navigationItem] setLeftBarButtonItem:cancelButton animated:NO];
    
    id<BHSettingsStorageProtocol> storage = [self storage];
    [[self proximityUUID] setText:[storage proximityUUID]];
    [[self majorNumber] setText:[storage majorNumberValue]];
    [[self minorNumber] setText:[storage minorNumberValue]];
}

#pragma mark - 

-(instancetype)initWithStorage:(id<BHSettingsStorageProtocol>)storage
{
    self = [super init];
    
    if(self) {
        _storage = storage;
    }
    
    return self;
}

#pragma mark -

+(instancetype)settingsViewControllerWithStorage:(id<BHSettingsStorageProtocol>)storage
{
    return [[self alloc] initWithStorage:storage];
}

@end
