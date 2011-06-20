//
//  UIViewWithRoundedCorners.m
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIViewWithRoundedCorners.h"


@implementation UIViewWithRoundedCorners

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
//    return self;
    if (self) {
        CALayer *layer = self.layer;
        
        layer.masksToBounds = NO;
        layer.borderColor = [UIColor colorWithRed:100.0/255.0f green:100.0/255.0f blue:100.0/255.0f alpha:1.0].CGColor;
        layer.borderWidth = 1.0f;
//        layer.cornerRadius = 6.0; // if you like rounded corners
//        layer.shouldRasterize = true;
        
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
