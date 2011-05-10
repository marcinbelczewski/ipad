//
//  PageControl.h
//
//  Replacement for UIPageControl because that one only supports white dots.
//
//  Created by Morten Heiberg <morten@heiberg.net> on November 1, 2010.
//

#import <UIKit/UIKit.h>

@protocol PageControlDelegate;

@interface PageControl : UIView 
{
@private
    NSInteger _currentPage;
    NSInteger _numberOfPages;
    id<PageControlDelegate> delegate;
    UIImage *_activePage;
    UIImage *_inactivePage;
    NSInteger _numberOfItems;
    NSInteger _itemsPerPage;
    float _dotDiameter;
    float _dotSpacer;
}

// Set these to control the PageControl.
@property (nonatomic) NSInteger currentPage;
@property (nonatomic, readonly) NSInteger numberOfPages;
@property (readonly) NSInteger firstActiveItem;
@property (readonly) NSInteger lastActiveItem;
@property(assign, nonatomic) float dotDiameter;
@property(assign, nonatomic) float dotSpacer;

@property (nonatomic) NSInteger numberOfItems;
@property (nonatomic) NSInteger itemsPerPage;

// Customize these as well as the backgroundColor property.

// Optional delegate for callbacks when user taps a page dot.
@property (nonatomic, assign) IBOutlet id<PageControlDelegate> delegate;


@property (nonatomic, retain) UIImage *activePage;
@property (nonatomic, retain) UIImage *inactivePage;


@end

@protocol PageControlDelegate<NSObject>
@optional
- (void)pageControlPageDidChange:(PageControl *)pageControl;
@end