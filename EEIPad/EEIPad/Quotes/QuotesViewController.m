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

@implementation QuotesViewController

- (void)dealloc
{
    [super dealloc];
    [timer release];
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
    timer = [NSTimer scheduledTimerWithTimeInterval:5.0 
                                             target:self 
                                           selector:@selector(refreshQuotes) 
                                           userInfo:nil 
                                            repeats:YES]; 
  
    [self refreshQuotes];
}

-(void)refreshQuotes
{
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.globalinsight.test.idmanagedsolutions.com/json/indexlist"]];
    quotes = [jsonData objectFromJSONData];
    [indicesTableController setData:[[[quotes objectForKey:@"tabs"] objectAtIndex:0] objectForKey:@"symbols"]];
    [commoditiesTableController setData:[[[quotes objectForKey:@"tabs"] objectAtIndex:1] objectForKey:@"symbols"]];
    [stocksTableController setData:[[[quotes objectForKey:@"tabs"] objectAtIndex:2] objectForKey:@"symbols"]];    
    [indicesTable reloadData];
    [commoditiesTable reloadData];
    [stocksTable reloadData]; 
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy HH:mm:ss"];
    
    NSDate *now = [[NSDate alloc] init];
    
    NSString *dateString = [format stringFromDate:now];    
    updatedLabel.text  = dateString;
    [now release];
    [format release];   
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
