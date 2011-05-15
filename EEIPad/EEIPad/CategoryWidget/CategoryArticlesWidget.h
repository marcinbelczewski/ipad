//
//  ViewBased4EEIPadViewController.h
//  ViewBased4EEIPad
//
//  Created by Worker on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryViewController.h"
#import "Widget.h"
@interface CategoryArticlesWidget : UIViewController<ParametrizedWidget> {
    
    UIWebView *articleView;
    CategoryViewController *categoryViewDeletegate;
    UITableView *listView;
}
@property (nonatomic, retain) IBOutlet UIWebView *articleView;
@property (nonatomic, retain) IBOutlet CategoryViewController *categoryViewDeletegate;
@property (nonatomic, retain) IBOutlet UITableView *listView;

@end

@interface SpotlightArticlesWidget : CategoryArticlesWidget {
}

@end

@interface NewsArticlesWidget : CategoryArticlesWidget {
}

@end