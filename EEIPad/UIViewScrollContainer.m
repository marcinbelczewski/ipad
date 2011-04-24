//
//  UIViewScrollContainer.m
//  EEIPad
//
//  Created by Worker on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewScrollContainer.h"


@implementation UIViewScrollContainer

@synthesize scrollView;

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
    self.backgroundColor = [UIColor clearColor];
    
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

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//	if ([self pointInside:point withEvent:event]) {
//		return scrollView;
//	}
//	return nil;
//}

@end
