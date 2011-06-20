//
//  UIViewWithGradient.m
//  EEIPad
//
//  Created by Worker on 5/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIViewWithGradient.h"


@implementation UIViewWithGradient

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self.layer.masksToBounds = YES;
//        self.backgroundColor = [UIColor clearColor];
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.frame = self.bounds;
//        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:246.0/255.0f green:246.0/255.0f blue:246.0/255.0f alpha:1.0] CGColor], (id)[[UIColor colorWithRed:226.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1.0] CGColor], nil];
//        gradient.masksToBounds = YES;
//        [self.layer insertSublayer:gradient atIndex:0];        
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
