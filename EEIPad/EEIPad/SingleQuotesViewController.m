//
//  SingleQuotesViewController.m
//  EEIPad
//
//  Created by Piotr Mionskowski on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SingleQuotesViewController.h"
#import "QuotesTableDelegate.h"


@implementation SingleQuotesViewController

@synthesize indices = _indices;
@synthesize indicesTable = _indicesTable;


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

    self.indices.ownerView = self.indicesTable;
    [self.indices startLoadingQuotes:@"IndicesUpdate"];

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
