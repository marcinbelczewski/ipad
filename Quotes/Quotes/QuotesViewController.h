//
//  QuotesViewController.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebRequest.h"
@class QuotesTableDelegate;


@interface QuotesViewController : UIViewController/*<WebRequestDelegate, UITableViewDataSource, UITableViewDelegate>*/ {
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
}
-(void)refreshQuotes;
@end
