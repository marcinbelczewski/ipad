//
//  UIViewWithShadow.m
//  EEIPad
//
//  Created by Worker on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "UIViewWithShadow.h"


@implementation UIViewWithShadow

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.masksToBounds = NO;
        self.layer.cornerRadius = 6; // if you like rounded corners
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.3;    
        self.layer.shouldRasterize = true;
    }
    return self;
    
}

-(id)hideShadow
{
    self.layer.shadowOpacity = 0.0;
}

- (id)showShadow
{
    self.layer.shadowOpacity = 0.3;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
