//
//  SingleQuotesViewController.m
//  EEIPad
//
//  Created by Piotr Mionskowski on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Widget.h"
#import "SingleQuotesViewController.h"
#import "QuotesTableDelegate.h"
#import "UIViewController+ShowActivityIndicator.h"
#import "QuotesCategory.h"
#import "NSDate+Format.h"


@implementation SingleQuotesViewController
@synthesize indices = _indices;
@synthesize indicesTable = _indicesTable;
@synthesize quotesType = _quotesType;
@synthesize lastUpdated = _lastUpdated;


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
    [_indices release];
    [_indicesTable release];
    [_quotesType release];
    [_lastUpdated release];
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
    // Do any additional setup after loading the view from its nib.



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

-(UIView *)activityParent {
    return self.view.superview;
}

-(void)quotesUpdate:(id)category {
    QuotesCategory *quotesCategory = [category object];
    [self hideActivity];
    NSDate *date = quotesCategory.lastUpdate;
    NSString *string = [date stringWithDateAndTime];
    self.lastUpdated.text = string;
}

- (void)setParam:(NSString *)parameter {
    [self showActivity];
    self.quotesType = parameter;
    self.indices.ownerView = self.indicesTable;
    [self.indices startLoadingQuotes:self.quotesType];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(quotesUpdate:) name:self.quotesType object:nil];
}


@end
