//
//  WidgetLg.m
//  SplitViewTest1
//
//  Created by Worker on 4/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "WidgetLg.h"
#import "WidgetConfig.h"
#import "EEIAppDelegate.h"


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
    [self expand];
     }

- (IBAction)RestoreClicked:(id)sender {
    [UIView animateWithDuration:0.4
                     animations: ^{[self.view setFrame:frameRectInRootController];} 
                     completion:  ^(BOOL finished){
                         [self.view showShadow];
                         [originalSuperView addSubview: self.view];
                         [self.view setFrame:frameRect];
                         expandButton.hidden = false;
                         restoreButton.hidden = true;
                         
                     }
     ];
}

-(void)expand {
    if (self.isExpanded)
        return;
    _isExpanded = true;
    
    originalSuperView = self.view.superview;
    EEIAppDelegate *eeiapp= [[UIApplication sharedApplication] delegate];
    UIViewController *rootcontroller = [[eeiapp window]rootViewController];
    CGRect frame = rootcontroller.view.bounds;
    frameRect = self.view.frame;
    frameRectInRootController = [originalSuperView convertRect:self.view.frame toView:eeiapp.window.rootViewController.view];
    
    [eeiapp.window.rootViewController.view addSubview: self.view];
    
    [self.view setFrame:frameRectInRootController];
    [self.view hideShadow];
    [UIView animateWithDuration:0.4
                     animations:^{
                         [self.view setFrame:CGRectMake(0+10, 44+10, rootcontroller.view.bounds.size.width-20, rootcontroller.view.bounds.size.height-20-2*44)];                         
                     }
                     completion:^(BOOL finished) {
                         expandButton.hidden = true;
                         restoreButton.hidden = false;                         
                     }
     ];
    
}
-(void)collapse
{
    if (!self.isExpanded)
        return;
    _isExpanded = false;
    
    [self.view setFrame:frameRectInRootController];
    [self.view showShadow];
    [originalSuperView addSubview: self.view];
    [self.view setFrame:frameRect];
    expandButton.hidden = false;
    restoreButton.hidden = true;
    
    
}
@end
