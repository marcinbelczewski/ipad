//
//  QuotesTableCell.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface QuotesTableCell : UITableViewCell {
    IBOutlet UILabel *name;
    IBOutlet UILabel *price;
    IBOutlet UILabel *change;
    IBOutlet UILabel *changePercent;
    IBOutlet UIImageView *trendImage;
}
@property (nonatomic, retain) IBOutlet UILabel *name;
@property (nonatomic, retain) IBOutlet UILabel *price;
@property (nonatomic, retain) IBOutlet UILabel *change;
@property (nonatomic, retain) IBOutlet UILabel *changePercent;
@property (nonatomic, retain) IBOutlet UIImageView *trendImage;
@end
