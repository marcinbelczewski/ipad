//
//  DetailViewController.m
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "AppConfig.h"
@implementation DetailViewController

@synthesize upperScrollM = _upperScrollM;
@synthesize lowerScrollM = _lowerScrollM;
@synthesize toolbar=_toolbar;
@synthesize upperScroll = _upperScroll;
@synthesize upperPager = _upperPager;
@synthesize lowerScroll = _lowerScroll;
@synthesize lowerPager = _lowerPager;

- (void)configureView
{
    // Update the user interface for the detail item.

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    AppConfig *config = [AppConfig EEIPadAppConfig];
    [self.upperScrollM setupWithWidgets:config.smallWidgets andConfig:config.smalScrollView];
    [self.lowerScrollM setupWithWidgets:config.largeWidgets andConfig:config.largeScrollView];
}

- (void)viewDidUnload
{
    [self setUpperScrollM:nil];
    [self setLowerScrollM:nil];
    [self setUpperPager:nil];
    [self setLowerPager:nil];
    [self setLowerScroll:nil];
    [self setUpperScroll:nil];
    [self setLowerScroll:nil];
	[super viewDidUnload];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_toolbar release];
    [_upperScroll release];
    [_lowerScroll release];
    [_upperPager release];
    [_lowerPager release];
    [_upperScrollM release];
    [_lowerScrollM release];
    [super dealloc];
}
@end
