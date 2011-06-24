//
//  WidgetLg.m
//  SplitViewTest1
//
//  Created by Worker on 4/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WidgetLg.h"
#import "EEIAppDelegate.h"
#import "UIViewWithShadow.h"


@implementation WidgetLg
@synthesize restoreButton;
@synthesize expandButton;
@synthesize isExpanded=_isExpanded;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)dealloc
{
    [label release];
    [restoreButton release];
    [expandButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)viewDidUnload
{
    [self setView:nil];
    [self setLabel:nil];
    [self setRestoreButton:nil];
    [self setExpandButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)ExpandClicked:(id)sender {
    [self expandWithAnimation:YES];
 }

- (IBAction)RestoreClicked:(id)sender {
    [self collapseWithAnimation:YES];
}

- (void)transitionWith:(void(^)()) transition andCompletion: (void(^)()) completion animate: (BOOL) animate
{
    if (animate)
    {
        [UIView animateWithDuration:0.4
                         animations:^{
                            transition();
                         }
                         completion:^(BOOL finished) {
                             completion();
                         }
         ];
    }
    else
    {
        transition();
        completion();
    }

}
- (void)expandWithAnimation:(BOOL)animation {

    if (self.isExpanded)
        return;
    _isExpanded = true;
    
    originalSuperView = self.view.superview;
    UIView *rootView = [[[[UIApplication sharedApplication] delegate] window]rootViewController].view;
    UIViewWithShadow *ourView = (UIViewWithShadow *)self.view;
    frameRect = ourView.frame;
    frameRectInRootController = [originalSuperView convertRect:ourView.frame toView:rootView];


    void (^beginAnim)() = ^{
        [ourView hideShadow];
        [rootView addSubview: ourView];
        [ourView setFrame:frameRectInRootController];
        [ourView setFrame:CGRectMake(0+10, 44+10, rootView.bounds.size.width-20, rootView.bounds.size.height-20-2*44)];
    };

    void (^completeAnim)() = ^
    {
        expandButton.hidden = true;
        restoreButton.hidden = false;

    };
    [self transitionWith:beginAnim andCompletion:completeAnim animate:animation];
}

- (void)collapseWithAnimation:(BOOL)animation {
    if (!self.isExpanded)
        return;
    _isExpanded = false;
    UIViewWithShadow *ourView = (UIViewWithShadow *)self.view;

    void (^beginAnim)() = ^{[self.view setFrame:frameRectInRootController];};
    void (^completeAnim)() = ^ {
        [ourView showShadow];
        [originalSuperView addSubview: self.view];
        [self.view setFrame:frameRect];
        expandButton.hidden = false;
        restoreButton.hidden = true;

    };
    [self transitionWith:beginAnim andCompletion:completeAnim animate:animation];

}
@end
