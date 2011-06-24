//
//  ScrollManager.m
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollManager.h"
#import "ScrollViewConfig.h"
#import <QuartzCore/QuartzCore.h>
#import "Widget.h"


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

- (void)setupWithWidgets:(NSMutableArray *)array andConfig:(ScrollViewConfig *)config {
    widgets = [[NSMutableArray alloc] init];
    viewConfig = config;

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



    pageControl.numberOfItems = [widgets count];
    pageControl.itemsPerPage = viewConfig.widgetsPerPage;
    pageControl.currentPage = 0;

    scrollView.pagingEnabled = NO;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(([widgets count]) * ([self calculateItemWidth]), scrollView.frame.size.height);
    scrollView.frame = CGRectMake(
            0,
            scrollView.frame.origin.y,
            [self calculateItemWidth] * (viewConfig.widgetsPerPage) + 1,
            scrollView.frame.size.height);

//    scrollView.backgroundColor = [UIColor yellowColor];
    scrollView.clipsToBounds = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;


    for (int page = 0; page< (1 + viewConfig.widgetsPerPage); page++)
    {
        [self loadScrollViewWithPage:page];
    }
    [self setAlphaForAllPages];

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
- (void)resizeWidgetsWithWidth:(NSInteger)newWidth andDuration:(NSTimeInterval)duration
{
//    originalViewConfig = viewConfig copy];
    viewConfig.widgetWidth = newWidth;
    
    scrollView.contentSize = CGSizeMake(([widgets count]) * ([self calculateItemWidth]), scrollView.frame.size.height - 2);
    scrollView.frame = CGRectMake(
                                  0,
                                  scrollView.frame.origin.y,
                                  [self calculateItemWidth] * (viewConfig.widgetsPerPage) + 1,
                                  scrollView.frame.size.height);
    __block int p = self.pageControl.currentPage;
    for (__block int w =0; w<[widgets count]; w++) {
        UIViewController *controller = [viewControllers objectAtIndex:w];
        if ((NSNull *)controller != [NSNull null]) {
            [UIView animateWithDuration:duration
                             animations:^{
                                 CGRect frame = scrollView.frame;
                                 frame.origin.x = w * [self calculateItemWidth];
                                 frame.origin.y = 0;
                                 frame.size.width = viewConfig.widgetWidth;
                                 controller.view.frame = frame;
                                 controller.view.layer.frame = frame;
                                 controller.view.layer.shadowPath = [UIBezierPath bezierPathWithRect:controller.view.bounds].CGPath;
                                 controller.view.layer.shouldRasterize = YES;
                                 frame = scrollView.frame;
                                 frame.origin.x = p * [self calculateItemWidth];
                                 frame.origin.y = 0;
                                 [scrollView setContentOffset:frame.origin];
                                 
                                 [self setAlphaForAllPages];
                             }
                             completion:^(BOOL finished) {
                             }
             ];
            
            
        }
    }
}

- (void)loadScrollViewWithPage:(int)page {
    if ((page < 0)||(page >= [widgets count]))
        return;
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
        frame.origin.x = (page) * [self calculateItemWidth];
        frame.origin.y = 0;
        frame.size.width = viewConfig.widgetWidth;
        controller.view.frame = frame;
        [controller.view setupShadow];
        [scrollView addSubview:controller.view];

    }
}

- (int)currentPageFromOffset {
    CGFloat pageWidth = [self calculateItemWidth];
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    return page;
}
- (void)loadActiveAndNeighbourPages {
    for (int item = pageControl.firstActiveItem - 1; item <= pageControl.lastActiveItem + 1 ; item++) {
        [self loadScrollViewWithPage:item];
    }
}


- (void)updatePageAndLoadContent {
    int page = [self currentPageFromOffset];
    //NSLog(@"scrolling page = %d", page);
    pageControl.currentPage = page;

    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadActiveAndNeighbourPages];
}

- (void)calculateScrollDirection {
    int xOffset = scrollView.contentOffset.x;
    if (xOffset > lastXOffset + 1){
        direction = 1;
    }
    if(xOffset < lastXOffset - 1){
        direction = -1;
    }
    if (xOffset == lastXOffset - 1 || xOffset == lastXOffset  +1){
        direction = 0;
    }
    lastXOffset = xOffset;
}

-(void) setAlphaForIndividualPage:(int) index
{

    id obj= [viewControllers objectAtIndex:index];
    if((NSNull*)obj== [NSNull null])
        return;
    UIView *page= ((UIViewController*)obj).view;
    int pageCenter = page.frame.origin.x+viewConfig.widgetWidth/2;
    int whiteRangeMin = scrollView.contentOffset.x+viewConfig.widgetWidth/2-4;
    int whiteRangeMax = whiteRangeMin+(viewConfig.widgetWidth+marginWidth)*(viewConfig.widgetsPerPage-1)+4;
    if ((pageCenter>=whiteRangeMin)&&(pageCenter<=whiteRangeMax))
        page.alpha = 1.0;
    else if(pageCenter<whiteRangeMin)
        page.alpha=1.0-(double)(whiteRangeMin-pageCenter)/(double)(1.5*viewConfig.widgetWidth);
    else
        page.alpha=1.0-(double)(pageCenter-whiteRangeMax)/(double)(1.5*viewConfig.widgetWidth);
}

- (void) setAlphaForAllPages 
{
//    return;
    int page = [self currentPageFromOffset];
    for(int i=page-1;i<=page+viewConfig.widgetsPerPage;i++)
        if((i>=0)&&(i<[widgets count]))
            [self setAlphaForIndividualPage:i];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    [self calculateScrollDirection];
    [self setAlphaForAllPages];

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
    pageControlUsed = NO;
}



// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
}

- (BOOL)needScrollToNextPage {
    return direction == 1 && pageControl.currentPage < pageControl.numberOfPages - 1;
}

- (BOOL)needScrollToPreviousPage {
    return direction == -1 && pageControl.currentPage > 0;
}

- (BOOL)needToChangePage {
    return [self needScrollToNextPage] || [self needScrollToPreviousPage];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    pageControlUsed = NO;
    if ([self needToChangePage]){
        pageControl.currentPage += direction;
        [self changePage];
    }

}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if(!decelerate)
    {
        [self calculateScrollDirection];
        pageControlUsed = NO;
        pageControl.currentPage += direction;
        [self pageControlPageDidChange: pageControl];
    }
}


-(void)pageControlPageDidChange:(PageControl *)_pageControl {
    int page = _pageControl.currentPage;
    [self loadActiveAndNeighbourPages];

    CGRect frame = scrollView.frame;
    frame.origin.x = page * [self calculateItemWidth];
    frame.origin.y = 0;
    [scrollView setContentOffset:frame.origin animated:YES];
    pageControlUsed = YES;
    [self setAlphaForAllPages];
}

- (IBAction)changePage {
    [self pageControlPageDidChange:pageControl];
 }
-(void)collapseWidgets
{
    for (__block int w =0; w<[widgets count]; w++) {
        
        UIViewController *controller = [viewControllers objectAtIndex:w];
        if ((NSNull *)controller != [NSNull null]) {
            if([controller conformsToProtocol:@protocol(ExpandableWidget)])
            {
                id<ExpandableWidget> expandable = controller;
                [expandable collapseWithAnimation:NO];
            }
            
        }
    }
    
}
@end
