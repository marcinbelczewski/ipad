//
//  SingleQuotesViewController.h
//  EEIPad
//
//  Created by Piotr Mionskowski on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuotesTableDelegate;


@interface SingleQuotesViewController : UIViewController {

@private
    QuotesTableDelegate *_indices;
    UITableView *_indicesTable;
}

@property (retain, nonatomic) IBOutlet QuotesTableDelegate *indices;
@property (retain, nonatomic) IBOutlet UITableView *indicesTable;


@end
