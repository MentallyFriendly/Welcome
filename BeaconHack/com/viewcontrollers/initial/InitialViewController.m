//
//  InitialViewController.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

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
    
    __block UIViewController* this = self;
    
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        if([Model sharedInstance].isInitialStartUp)
        {
            UIViewController* controller = [this.storyboard instantiateViewControllerWithIdentifier:@"ConfigNavController"];
            [this presentViewController:controller animated:YES completion:nil];
        }
        else
        {
            UIViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
            [self presentViewController:controller animated:YES completion:nil];
        }
        
    });
}

@end
