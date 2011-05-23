//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "UIView+ShowActivityIndicator.h"
#import "UIViewController+ShowActivityIndicator.h"


@implementation UIViewController(ShowActivityIndicator)

-(UIView *)targetIndicatorParent {
    if ([self respondsToSelector:@selector(activityParent)]){
        return [self activityParent];
    }
    return self.view;
}

- (void)hideActivity {
    [[self targetIndicatorParent] hideActivity];
}

- (void)showActivity {
    [[self targetIndicatorParent] showActivity];
}

- (void)showActivity:(UIActivityIndicatorViewStyle)indicatorStyle {
    [[self targetIndicatorParent] showActivity: indicatorStyle];
}

@end