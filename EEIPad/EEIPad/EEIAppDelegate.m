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
#import "LoginView.h"
#import "Urls.h"


@implementation EEIAppDelegate


@synthesize window=_window;
@synthesize detailViewController=_detailViewController;
@synthesize loginView = _loginView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.


    // Add the split view controller's view to the window and display.
    self.window.rootViewController = self.loginView;
    self.loginView.delegate = self;
    [self.window makeKeyAndVisible];
    //[dataUrl release];
    return YES;
}


- (void)dealloc
{
    [_window release];
    [_detailViewController release];
    [_quotesService release];
    [_loginView release];
    [super dealloc];
}

- (void)loggedIn:(NSString *)userName {
    self.detailViewController = [[[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil] autorelease];

    self.window.rootViewController = self.detailViewController;
    self.loginView = nil;

    NSURL *dataUrl = [Urls defaultPrices];
    _quotesService = [[QuotesService alloc] initWithUrl:dataUrl];

}


@end
