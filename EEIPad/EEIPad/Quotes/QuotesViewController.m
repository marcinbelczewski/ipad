//
//  QuotesViewController.m
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesViewController.h"
#import "JSONKit.h"
#import "QuotesTableCell.h"
#import "QuotesViewController.h"
#import "WebRequest.h"
#import "QuotesTableDelegate.h"
#import "QuotesModel.h"


@implementation QuotesViewController

- (void)dealloc
{
    [super dealloc];
    [timer release], timer = nil;
  //  [quotes release], quotes = nil;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    webRequest = [[WebRequest alloc] initWithURLString:@"http://www.globalinsight.test.idmanagedsolutions.com/json/indexlist"];
    webRequest.delegate = self;
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0 
                                             target:self 
                                           selector:@selector(refreshQuotes) 
                                           userInfo:nil 
                                            repeats:YES]; 
  
    [self refreshQuotes];
}

-(void)refreshQuotes
{    
    [webRequest makeRequest];
}

-(void) dataLoaded:(NSData*)data
{
    NSDictionary *dictionary = [data objectFromJSONData];
    QuotesModel *quotes = [[QuotesModel alloc] initWithDictionary:dictionary];  
    [indicesTableController setData:quotes.Indices.quotes];
    [commoditiesTableController setData:quotes.Indices.quotes];
    [stocksTableController setData:quotes.Indices.quotes];    
    [indicesTable reloadData];
    [commoditiesTable reloadData];
    [stocksTable reloadData]; 
    updatedLabel.text  = quotes.lastUpdate;    
}
-(void) requestFailed:(NSString*) errMsg
{
    
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


-(IBAction)chosenView:(id)sender
{
	switch ([viewsSwitcher selectedSegmentIndex]) {
		case 0:
			[indicesTable setHidden:NO];
			[commoditiesTable setHidden:YES];
			[stocksTable setHidden:YES];
            break;
		case 1:
			[indicesTable setHidden:YES];
			[commoditiesTable setHidden:NO];
			[stocksTable setHidden:YES];
			break;
		case 2:
			[indicesTable setHidden:YES];
			[commoditiesTable setHidden:YES];
			[stocksTable setHidden:NO];
			break;
		default:
			[indicesTable setHidden:NO];
			[commoditiesTable setHidden:YES];
			[stocksTable setHidden:YES];
			break;
	}
}
@end
