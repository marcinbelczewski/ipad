//
//  ViewBased4EEIPadViewController.m
//  ViewBased4EEIPad
//
//  Created by Worker on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoryArticlesWidget.h"

@implementation CategoryArticlesWidget
@synthesize articleView;
@synthesize categoryViewDeletegate;
@synthesize listView;

- (void)dealloc
{
    [articleView release];
    [categoryViewDeletegate release];
    [listView release];
    [super dealloc];
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
    NSString *urlAddress = @"http://www.google.com";
    
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    listView.allowsSelection=YES;
    [listView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:true scrollPosition:UITableViewScrollPositionTop];
    //Load the request in the UIWebView.
    [articleView loadRequest:requestObj];
}


- (void)viewDidUnload
{
    [self setArticleView:nil];
    [self setCategoryViewDeletegate:nil];
    [self setListView:nil];
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
