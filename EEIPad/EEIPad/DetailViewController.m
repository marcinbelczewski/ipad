//
//  DetailViewController.m
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "AppConfig.h"
#import "UIViewScrollContainer.h"
@implementation DetailViewController



@synthesize toolbar=_toolbar;
@synthesize upperContainer;
@synthesize lowerContainer;


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
    [self.upperContainer setupWithWidgets:config.smallWidgets andConfig:config.smalScrollView];
    [self.lowerContainer setupWithWidgets:config.largeWidgets andConfig:config.largeScrollView];
}

- (void)viewDidUnload
{
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
    [upperContainer release];
    [lowerContainer release];
    [super dealloc];
}
@end
