//
//  Widget.m
//  EEIPad
//
//  Created by Worker on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Widget.h"
#import "WidgetConfig.h"

@implementation Widget
@synthesize widgetConfig, subView;
@synthesize label;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) configureWith:(WidgetConfig *)config
{
    widgetConfig=config;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor clearColor];
    [label setText:widgetConfig.label];
//    return;
    if(subView!=nil)
    {

        
        subView.view.backgroundColor = [UIColor clearColor];
        subView.view.frame = widgetConfig.widgetRect;
        subView.view.contentMode = UIViewContentModeScaleToFill;
        subView.view.autoresizingMask =    
//          UIViewAutoresizingFlexibleLeftMargin+
          UIViewAutoresizingFlexibleWidth+
          UIViewAutoresizingFlexibleRightMargin+
//          UIViewAutoresizingFlexibleTopMargin+
          UIViewAutoresizingFlexibleHeight+
          UIViewAutoresizingFlexibleBottomMargin;

        if([[self.view subviews] count]>0)
            [[self.view.subviews objectAtIndex:0] addSubview:subView.view];
        else
            [self.view addSubview:subView.view];
        
        if([subView conformsToProtocol: @protocol(ParametrizedWidget)])
            [(id<ParametrizedWidget>)subView setParam:widgetConfig.parameter];
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
