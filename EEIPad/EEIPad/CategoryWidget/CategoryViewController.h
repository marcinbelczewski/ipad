//
//  CategoryViewController.h
//  ViewBased4EEIPad
//
//  Created by Worker on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CategoryViewController : NSObject<UITableViewDataSource,UITableViewDelegate> {
    UIWebView *articleView;
    NSArray *articles;
}

@property (retain,nonatomic) IBOutlet UIWebView *arcticleView;

@end
