//
//  SplitViewTest1AppDelegate.m
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EEIAppDelegate.h"


#import "DetailViewController.h"
#import "QuotesService.h"

@implementation EEIAppDelegate


@synthesize window=_window;
@synthesize detailViewController=_detailViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    NSURL *dataUrl = [[NSURL alloc] initWithString:@"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/DefaultPrices"];
    _quotesService = [[QuotesService alloc] initWithUrl:dataUrl];

    // Add the split view controller's view to the window and display.
    self.window.rootViewController = self.detailViewController;
    [self.window makeKeyAndVisible];
    [dataUrl release];
    return YES;
}


- (void)dealloc
{
    [_window release];
    [_detailViewController release];
    [_quotesService release];
    [super dealloc];
}

@end
