//
//  SummaryCell.h
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 6/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SummaryCell : UITableViewCell {
    
    UILabel *title;
    UILabel *category;
    UILabel *date;
    UILabel *summary;
    UIImageView *image;
}
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UILabel *category;
@property (nonatomic, retain) IBOutlet UILabel *date;
@property (nonatomic, retain) IBOutlet UILabel *summary;
@property (nonatomic, retain) IBOutlet UIImageView *image;

@end
