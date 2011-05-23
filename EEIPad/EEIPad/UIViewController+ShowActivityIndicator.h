//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//


#import <Foundation/Foundation.h>
#import "UIView+ShowActivityIndicator.h"

@protocol ActivityShowerController<ActivityShower >
@optional
@property(readonly) UIView *activityParent;
@end

@interface UIViewController(ShowActivityIndicator) <ActivityShowerController>

@end