//
//  UIViewScrollContainer.h
//  EEIPad
//
//  Created by Worker on 4/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewScrollContainer : UIView {
    UIScrollView *scrollView;    
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end
