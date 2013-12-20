//
//  BHTextField.m
//  BeaconHack
//
//  Created by Stephen Chan on 12/20/13.
//  Copyright (c) 2013 Squid Ink Games. All rights reserved.
//

#import "BHTextField.h"

@implementation BHTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.backgroundColor = [UIColor clearColor].CGColor;
    self.layer.borderWidth= 2.0f;
    self.layer.cornerRadius = 3;
    self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10,0)];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10,0)];
    self.rightViewMode = UITextFieldViewModeAlways;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
