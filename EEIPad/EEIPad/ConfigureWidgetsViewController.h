//
//  ConfigureWidgetsViewController.h
//  EEIPad
//
//  Created by Piotr Mionskowski on 6/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ConfigureWidgetsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    
    UITableView *table;
    UIView *tableContainer;
}
@property (nonatomic, retain) IBOutlet UITableView *table;
@property (nonatomic, retain) IBOutlet UIView *tableContainer;

@end
