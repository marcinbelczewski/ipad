//
//  ScrollManager.h
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScrollViewConfig;
@interface ScrollManager : NSObject<UIScrollViewDelegate>
{
@protected
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    NSMutableArray *viewControllers;
    BOOL pageControlUsed;
    int margin;

    NSMutableArray *widgets;
    ScrollViewConfig *viewConfig;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;

- (IBAction)changePage:(id)sender;
- (void) setupWithWidgets: (NSMutableArray *) array andConfig: (ScrollViewConfig *) config;

@end
