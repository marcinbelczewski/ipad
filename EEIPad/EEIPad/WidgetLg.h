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

@interface WidgetLg : Widget<ExpanableWidget> {
    
    UIButton *restoreButton;
    UIButton *expandButton;
    CGRect frameRect,frameRectInRootController;
    UIView *originalSuperView;
@private
    bool _isExpanded;
}

- (IBAction)ExpandClicked:(id)sender;
- (IBAction)RestoreClicked:(id)sender;
@property (nonatomic, retain) IBOutlet UIButton *restoreButton;
@property (nonatomic, retain) IBOutlet UIButton *expandButton;

@end
