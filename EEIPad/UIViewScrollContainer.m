//
//  UIViewScrollContainer.m
//  EEIPad
//
//  Created by Worker on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewScrollContainer.h"
#import "ScrollViewConfig.h"
#import "ScrollManager.h"


@implementation UIViewScrollContainer

@synthesize scrollView;
@synthesize scrollManager = _scrollManager;
@synthesize pageControl = _pageControl;


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

    }

    return self;
}

- (void)awakeFromNib {
//    self.backgroundColor = [UIColor clearColor];

}

- (void)dealloc {
    [scrollView release];
    [_scrollManager release];
    [_pageControl release];
    [super dealloc];
}

- (void)setupWithWidgets:(NSMutableArray *)array andConfig:(ScrollViewConfig *)config {
    [_scrollManager setupWithWidgets:array andConfig:config];

    self.clipsToBounds = NO;
    self.frame = CGRectMake(
            overlapWidth + marginWidth,
            self.frame.origin.y,
            [_scrollManager calculateItemWidth] * _scrollManager.pageControl.numberOfPages*0+self.superview.frame.size.width-(overlapWidth + marginWidth),
            self.frame.size.height);
}


@end
