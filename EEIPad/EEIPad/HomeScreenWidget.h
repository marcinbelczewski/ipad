//
//  HomeScreenWidget.h
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebRequest.h"


@interface HomeScreenWidget : UITableViewController<WebRequestDelegate> {
@private

    WebRequest *_webRequest;
    UIActivityIndicatorView *_activityIndicator;
    NSMutableArray *_articles;
}
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
