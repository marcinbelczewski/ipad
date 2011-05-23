//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//


#import <Foundation/Foundation.h>

@protocol ActivityShower
-(void)showActivity;
-(void)hideActivity;
@end

@interface UIView(ShowActivityIndicator) <ActivityShower>
@end