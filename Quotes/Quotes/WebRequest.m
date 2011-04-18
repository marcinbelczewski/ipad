//
//  WebRequest.m
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebRequest.h"
#import "JSONKit.h"


@implementation WebRequest
@synthesize delegate;

-(id) initWithURL:(NSString*)requestURL {
	if (self == [super init]) {
		url = [requestURL retain];
	}
	return self;
}

-(void) makeRequest {    	    
	if (urlConnection != nil) {
		[urlConnection release];
		urlConnection = nil;
	}		
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
	urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    
	UIApplication* app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = YES;
}

-(void) cancelRequest {
	
	if (urlConnection) {
		[urlConnection cancel];
		[urlConnection release];
		urlConnection = nil;
		[data release];
		data = nil;
	}
	
	UIApplication* app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = NO;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"Did receive response: %@", response);
	
    [data release];
	data = [[NSMutableData alloc] init];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)dataReceived {
	assert(data != nil);
	[data appendData:dataReceived];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [data release];
	data = nil;
	[urlConnection release];
	urlConnection = nil;
	
	UIApplication* app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = NO;
	
	[delegate requestFailed:[error localizedDescription]];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[urlConnection release];
	urlConnection = nil;
	
	UIApplication* app = [UIApplication sharedApplication];
	app.networkActivityIndicatorVisible = NO;
	
	[delegate dataLoaded:data];
	
	[data release];
    data = nil;
}


-(void) dealloc {
	[data release];
	[urlConnection release];
	[url release];
	[super dealloc];
}

@end
