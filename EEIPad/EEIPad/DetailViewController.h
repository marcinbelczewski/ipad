//
//  DetailViewController.h
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "ScrollManager.h"

@interface DetailViewController : UIViewController {

    UIScrollView *_upperScroll;
    ScrollManager *_lowerScrollM;
    UIPageControl *_upperPager;
    UIScrollView *_lowerScroll;
    UIPageControl *_lowerPager;
    ScrollManager *_upperScrollM;
}

@property (nonatomic, retain) IBOutlet ScrollManager *upperScrollM;
@property (nonatomic, retain) IBOutlet ScrollManager *lowerScrollM;

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UIScrollView *upperScroll;
@property (nonatomic, retain) IBOutlet UIPageControl *upperPager;
@property (nonatomic, retain) IBOutlet UIScrollView *lowerScroll;
@property (nonatomic, retain) IBOutlet UIPageControl *lowerPager;


@end
