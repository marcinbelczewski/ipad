//
//  WidgetLg.m
//  SplitViewTest1
//
//  Created by Worker on 4/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WidgetLg.h"
#import "WidgetConfig.h"
#import "EEIAppDelegate.h"


@implementation WidgetLg
@synthesize restoreButton;
@synthesize expandButton;

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
    frameRect = self.view.frame;
    originalSuperView = self.view.superview;
    EEIAppDelegate *eeiapp= [[UIApplication sharedApplication] delegate];
//    [UIView setAnimationTransition: trans forView: [self view] cache: YES];
//    [eeiapp.window.rootViewController presentModalViewController:self animated:NO];
    [eeiapp.window.rootViewController.view addSubview: self.view];
    [self.view setFrame:CGRectMake(60, 420, self.view.frame.size.width, self.view.frame.size.height)];
    [UIView animateWithDuration:0.4 
                     animations:^{
                         [self.view setFrame:CGRectMake(0, 44, 768, 914)];                         
                     }
                     completion:^(BOOL finished) {
                         expandButton.hidden = true;
                         restoreButton.hidden = false;                         
                     }
     ];
     }

- (IBAction)RestoreClicked:(id)sender {
    [UIView animateWithDuration:0.4
                     animations: ^{[self.view setFrame:CGRectMake(60,420, frameRect.size.width, frameRect.size.height)];} 
                     completion:  ^(BOOL finished){
                         [originalSuperView addSubview: self.view];
                         [self.view setFrame:frameRect];
                         expandButton.hidden = false;
                         restoreButton.hidden = true;
                         
                     }
     ];
}
@end
