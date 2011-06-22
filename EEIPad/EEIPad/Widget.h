//
//  Widget.h
//  EEIPad
//
//  Created by Worker on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WidgetConfig;

@protocol ParametrizedWidget <NSObject>

- (void) setParam: (NSString *)parameter;

@end

@protocol  ExpanableWidget <NSObject>

@property (readonly) bool isExpanded;
-(void) expand;
-(void) collapse;


@end
@interface Widget : UIViewController {
    UILabel *label;
@protected
    WidgetConfig *widgetCornfig;
    UIViewController *subView;
}
- (void) configureWith: (WidgetConfig*) config;
@property (readwrite,retain) WidgetConfig* widgetConfig;
@property (readwrite,retain) UIViewController *subView;
@property (nonatomic, retain) IBOutlet UILabel *label;
@end
