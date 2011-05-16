//
//  CategoryViewController.h
//  ViewBased4EEIPad
//
//  Created by Worker on 4/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebRequest.h"
#import "ArticlesGroup.h"


@interface CategoryViewController : NSObject<UITableViewDataSource,UITableViewDelegate,WebRequestDelegate,UIWebViewDelegate> {
    UIWebView *articleView;
    UITableView *listView;
    NSMutableArray *articleGroups;
    WebRequest *webRequest;
}

@property (retain,nonatomic) IBOutlet UIWebView *arcticleView;
@property (retain,nonatomic) IBOutlet UITableView *listView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *listActivityIndicator;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *articleActivityIndicator;

-(NSDate *) dateFromJson: (NSString *)json;
-(void) refreshWithCategory: (NSString*)category;

@end
