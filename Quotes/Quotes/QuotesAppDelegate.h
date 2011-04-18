//
//  QuotesAppDelegate.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuotesViewController;

@interface QuotesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet QuotesViewController *viewController;

@end
