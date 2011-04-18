//
//  Widget.h
//  EEIPad
//
//  Created by Worker on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WidgetConfig;

@interface Widget : UIViewController {
    UILabel *label;
@protected
    WidgetConfig *widgetConfig;
    UIViewController *subView;
}
- (void) configureWith: (WidgetConfig*) config;
@property (readwrite,retain) WidgetConfig* widgetConfig;
@property (readwrite,retain) UIViewController *subView;
@property (nonatomic, retain) IBOutlet UILabel *label;
@end
