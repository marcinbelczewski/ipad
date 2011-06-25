//
//  SplitViewTest1AppDelegate.h
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@class QuotesService;
@class LoginView;

@interface EEIAppDelegate : NSObject <UIApplicationDelegate> {

    QuotesService * _quotesService;
    LoginView *_loginView;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) IBOutlet LoginView *loginView;

@end
