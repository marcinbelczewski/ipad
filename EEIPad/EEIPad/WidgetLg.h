//
//  WidgetLg.h
//  SplitViewTest1
//
//  Created by Worker on 4/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Widget.h"
@class WidgetConfig;

@interface WidgetLg : Widget {
    
    UIButton *restoreButton;
    UIButton *expandButton;
    UIView *titleView;
    UIView *bottomView;
    CGRect frameRect;
    UIView *originalSuperView;
}
- (IBAction)ExpandClicked:(id)sender;
- (IBAction)RestoreClicked:(id)sender;
@property (nonatomic, retain) IBOutlet UIButton *restoreButton;
@property (nonatomic, retain) IBOutlet UIButton *expandButton;
@property (nonatomic, retain) IBOutlet UIView *titleView;
@property (nonatomic, retain) IBOutlet UIView *bottomView;

@end
