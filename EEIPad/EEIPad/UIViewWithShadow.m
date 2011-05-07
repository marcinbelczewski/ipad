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
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 6; // if you like rounded corners
        self.layer.shadowOffset = CGSizeMake(5, 5);
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = 0.3;    
        self.layer.borderColor = [UIColor colorWithRed:159.0/255.0f green:159.0/255.0f blue:159.0/255.0f alpha:1.0].CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.frame =  CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width,30.0f);
//        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:246.0/255.0f green:246.0/255.0f blue:246.0/255.0f alpha:1.0] CGColor], (id)[[UIColor colorWithRed:226.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1.0] CGColor], nil];
//        gradient.masksToBounds = YES;
//        [self.layer insertSublayer:gradient atIndex:1];        

    }
    return self;
    
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
