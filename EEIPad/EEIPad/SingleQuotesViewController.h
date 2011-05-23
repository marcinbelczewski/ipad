//
//  SingleQuotesViewController.h
//  EEIPad
//
//  Created by Piotr Mionskowski on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuotesTableDelegate;
@protocol ParametrizedWidget;


@interface SingleQuotesViewController : UIViewController<ParametrizedWidget>{

@private
    QuotesTableDelegate *_indices;
    UITableView *_indicesTable;
    NSString *_quotesType;
    UILabel *_lastUpdated;
}

@property (retain, nonatomic) IBOutlet QuotesTableDelegate *indices;
@property (retain, nonatomic) IBOutlet UITableView *indicesTable;
@property (retain, nonatomic) IBOutlet UILabel *lastUpdated;

@property(retain) NSString *quotesType;
@end
