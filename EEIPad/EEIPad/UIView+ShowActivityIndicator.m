//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//

#import "NSArray+Linq.h"
#import "UIView+ShowActivityIndicator.h"


@implementation UIView(ShowActivityIndicator)

- (UIActivityIndicatorView *)findIndicator {
    UIActivityIndicatorView * indicator = [self.subviews first:^(id  item){
        if ([item isKindOfClass:[UIActivityIndicatorView class]]){
            return YES;
        }
        return NO;
    }];
    return indicator;
}
- (void)showActivity {
    [self showActivity:UIActivityIndicatorViewStyleGray];
}

- (void)showActivity:(UIActivityIndicatorViewStyle )indicatorStyle {
    UIActivityIndicatorView *activityIndicator = [self findIndicator];
    if (activityIndicator == nil){
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:indicatorStyle];
        activityIndicator.frame = self.frame;
        activityIndicator.center = self.center;
        activityIndicator.contentMode = UIViewContentModeCenter;
        [self addSubview:activityIndicator];
    }
    [activityIndicator startAnimating];
    [activityIndicator release];
}



- (void)hideActivity {
    UIActivityIndicatorView *indicator = [self findIndicator];
    if (indicator != nil){
        [indicator stopAnimating];
    }
}


@end