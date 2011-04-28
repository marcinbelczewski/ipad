//
//  QuotesViewController.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QuotesTableDelegate;
#import "WebRequest.h"


@interface QuotesViewController : UIViewController<WebRequestDelegate> {
	IBOutlet UISegmentedControl *viewsSwitcher;  
    NSDictionary *quotes;
    IBOutlet QuotesTableDelegate *indicesTableController;
    IBOutlet QuotesTableDelegate *commoditiesTableController;
    IBOutlet QuotesTableDelegate *stocksTableController;    
    IBOutlet UITableView *indicesTable;
    IBOutlet UITableView *commoditiesTable;
    IBOutlet UITableView *stocksTable;    
    IBOutlet UILabel *updatedLabel;
    NSTimer *timer;
    WebRequest *webRequest;
}
-(void)refreshQuotes;
@end
