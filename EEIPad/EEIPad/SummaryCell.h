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
    UIWebView *webView;
}
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UILabel *category;
@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
