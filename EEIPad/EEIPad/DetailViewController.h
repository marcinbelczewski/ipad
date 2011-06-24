//
//  DetailViewController.h
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>
#import "ScrollManager.h"

@class UIViewScrollContainer;
@class ConfigureWidgetsViewController;

@interface DetailViewController : UIViewController {

    UIViewScrollContainer *upperContainer;
    UIViewScrollContainer *lowerContainer;
@private
    ConfigureWidgetsViewController *_editView;
}



@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;

@property(nonatomic, retain) IBOutlet UIViewScrollContainer * upperContainer;
@property(nonatomic, retain) IBOutlet UIViewScrollContainer * lowerContainer;


@property(nonatomic, retain) ConfigureWidgetsViewController *editView;

- (IBAction)trashAction:(id)sender;
- (IBAction)doneAction:(id)sender;
- (IBAction)showEdit:(id)sender;

@end
