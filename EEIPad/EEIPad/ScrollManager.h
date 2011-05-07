//
//  ScrollManager.h
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSInteger overlapWidth = 40;
static NSInteger marginWidth = 20;

@class ScrollViewConfig;
@interface ScrollManager : NSObject<UIScrollViewDelegate>
{
@protected
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    NSMutableArray *viewControllers;
    BOOL pageControlUsed;

    NSMutableArray *widgets;
    ScrollViewConfig *viewConfig;
    int lastXOffset;
    char direction;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;

- (IBAction)changePage;
- (void) setupWithWidgets: (NSMutableArray *) array andConfig: (ScrollViewConfig *) config;

- (int)calculateItemWidth;


@end
