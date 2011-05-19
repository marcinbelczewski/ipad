//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "UIView+ShowActivityIndicator.h"
#import "UIViewController+ShowActivityIndicator.h"


@implementation UIViewController(ShowActivityIndicator)

- (void)hideActivity {
    [self.view hideActivity];
}

- (void)showActivity {
    [self.view showActivity];
}
@end