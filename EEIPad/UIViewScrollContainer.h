//
//  UIViewScrollContainer.h
//  EEIPad
//
//  Created by Worker on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollViewConfig;
@class ScrollManager;


@interface UIViewScrollContainer : UIView {
    UIScrollView *scrollView;

@private
    ScrollManager *_scrollManager;
    UIPageControl *_pageControl;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet ScrollManager *scrollManager;
@property (nonatomic,retain) IBOutlet UIPageControl *pageControl;




- (void) setupWithWidgets: (NSMutableArray *) array andConfig: (ScrollViewConfig *) config;

@end
