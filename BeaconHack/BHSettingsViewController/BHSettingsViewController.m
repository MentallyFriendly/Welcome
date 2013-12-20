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
    [[[self navigationController] navigationItem] setRightBarButtonItem:doneButton animated:NO];

    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                target:self
                                                                                action:@selector(userDidTapCancelButton)];
    [[[self navigationController] navigationItem] setLeftBarButtonItem:cancelButton animated:NO];
        
    [[self proximityUUID] setText:[[self storage] proximityUUID]];
    [[self majorNumber] setText:[[self storage] majorNumberValue]];
    [[self minorNumber] setText:[[self storage] minorNumberValue]];
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
