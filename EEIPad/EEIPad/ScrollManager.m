//
//  ScrollManager.m
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollManager.h"
#import "ScrollViewConfig.h"


static NSInteger overlapWidth = 40;
static NSInteger marginWidth = 20;

@interface ScrollManager (PrivateMethods)
- (void)loadScrollViewWithPage:(int)page;

- (void)scrollViewDidScroll:(UIScrollView *)sender;
@end

@implementation ScrollManager

@synthesize scrollView, pageControl, viewControllers;

- (ScrollManager *)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (int)calculateItemWidth {
    return (viewConfig.widgetWidth + marginWidth);
}



- (UIView *) hitTest:(CGPoint) point withEvent:(UIEvent *)event {
    UIView* child = nil;
    if ((child = [super hitTest:point withEvent:event]) == self)
    {
        return self.scrollView;
    }
    return child;
}



- (void)setupWithWidgets:(NSMutableArray *)array andConfig:(ScrollViewConfig *)config {
    widgets = [[NSMutableArray alloc] init];
    [widgets retain];
    viewConfig = config;
    [viewConfig retain];

    // view controllers are created lazily
    // in the meantime, load the array with placeholders which will be replaced on demand
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (id item in array) {
        [widgets addObject:item];
    }
    for (unsigned i = 0; i < [array count]; i++) {
        [controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    [controllers release];

    pageControl.backgroundColor = [UIColor clearColor];
    //viewConfig.widgetWidth = (scrollView.frame.size.width-marginWidth-2*overlapWidth - viewConfig.widgetsPerPage*marginWidth)/viewConfig.widgetsPerPage;


    pageControl.numberOfPages = ([widgets count] - viewConfig.widgetsPerPage) + 1;
    pageControl.currentPage = 0;

    // a page is the width of the scroll view
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake((pageControl.numberOfPages) * ([self calculateItemWidth]), scrollView.frame.size.height - 2);
    scrollView.frame = CGRectMake(
            0,
            scrollView.frame.origin.y,
            [self calculateItemWidth],
            scrollView.frame.size.height-2);
    //scrollView.contentSize = CGSizeMake(([self calculateItemWidth]), scrollView.frame.size.height);
    self.clipsToBounds = NO;
    self.frame = CGRectMake(
            overlapWidth+marginWidth,
            scrollView.frame.origin.y,
            [self calculateItemWidth] * pageControl.numberOfPages,
            scrollView.frame.size.height-2);

    scrollView.clipsToBounds = NO;
    //    scrollView.contentOffset = CGPointMake(overlapWidth, overlapWidth);
    //    scrollView.co = UIEdgeInsetsMake(0.0, overlapWidth ,0.0, overlapWidth);
    //    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, overlapWidth ,0.0, overlapWidth);

    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;


    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    for (int i = 0; i < (1 + viewConfig.widgetsPerPage); i++)
    {
        [self loadScrollViewWithPage:i];
    }

    //    [self loadScrollViewWithPage:1];
}

- (void)dealloc {
    [viewControllers release];
    [scrollView release];
    [pageControl release];

    [super dealloc];
}

- (UIView *)view {
    return self.scrollView;
}

- (void)loadScrollViewWithPage:(int)page {
    if (page < 0)
            return;
    if (page >= [widgets count])
            return;
    {
        // replace the placeholder if necessary
        UIViewController *controller = [viewControllers objectAtIndex:page];
        if ((NSNull *)controller == [NSNull null]) {
            controller = [[widgets objectAtIndex:page] instantiateWidget];
            [viewControllers replaceObjectAtIndex:page withObject:controller];
            [controller release];
        }

        // add the controller's view to the scroll view
        if (controller.view.superview == nil) {
            CGRect frame = scrollView.frame;
            frame.origin.x = (page) * (marginWidth + viewConfig.widgetWidth);
            frame.origin.y = 0;
            frame.size.width = viewConfig.widgetWidth;
            controller.view.frame = frame;
            [scrollView addSubview:controller.view];

        }

    }
}

- (int)currentPage {
    CGFloat pageWidth = [self calculateItemWidth];
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    return page;
}

- (void)updatePageAndLoadContent {
    int page = [self currentPage];
    //NSLog(@"scrolling page = %d", page);
    pageControl.currentPage = page;

    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    for (int i = -1; i <= viewConfig.widgetsPerPage; i++)
            [self loadScrollViewWithPage:page + i];
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed) {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
    // Switch the indicator when more than 50% of the previous/next page is visible
    //CGFloat pageWidth = scrollView.frame.size.width;
    [self updatePageAndLoadContent];
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //NSLog(@"beginDragging = %d", [self currentPage]);
    pageControlUsed = NO;
}



// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //NSLog(@"DidEndDeclaring = %d", [self currentPage]);
    pageControlUsed = NO;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
    //NSLog(@"willBeginDeclaring = %d", [self currentPage]);
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    //NSLog(@"endDraggin = %d", pageControl.currentPage);
   // [self snapToPosition:scrollView];
    //NSLog(@"scrolLViewDidEndDraggin = %d, direction = %d", [self currentPage], scrollDirection);

}

- (IBAction)changePage:(id)sender {
    int page = pageControl.currentPage;

    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];

    // update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = page * (marginWidth + viewConfig.widgetWidth);
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];

    // Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

@end
