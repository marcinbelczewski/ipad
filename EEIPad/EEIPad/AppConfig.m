//
//  AppConfig.m
//  EEIPad
//
//  Created by Worker on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppConfig.h"
#import "WidgetConfig.h"
#import "ScrollViewConfig.h"

@implementation AppConfig

@synthesize smallWidgets;
@synthesize largeWidgets;
@synthesize smalScrollView;
@synthesize largeScrollView;


-(void)addSmallWidget:(NSString *)name withLabel:(id)label
{
    if(smallWidgets==nil)
        smallWidgets = [[NSMutableArray alloc]init];
    [smallWidgets addObject:[[WidgetConfig alloc] initSmWithClass:name andLabel:label]];
}

-(void)addLargeWidget:(NSString *)name withLabel:(id)label
{
    if(largeWidgets==nil)
        largeWidgets = [[NSMutableArray alloc]init];
    
    [largeWidgets addObject:[[WidgetConfig alloc] initLgWithClass:name andLabel:label]];    
}

-(void)addLargeWidget:(NSString *)name withParameter:(NSString*)param withLabel:(id)label
{
    if(largeWidgets==nil)
        largeWidgets = [[NSMutableArray alloc]init];
    
    [largeWidgets addObject:[[WidgetConfig alloc] initLgWithClass:name andParameter:param andLabel:label]];    
}


- (void)addSmallWidget:(NSString *)name withParameter:(NSString *)param withLabel:(id)label {
     if(smallWidgets==nil)
        smallWidgets = [[NSMutableArray alloc]init];
    [smallWidgets addObject:[[WidgetConfig alloc] initLgWithClass:name andParameter:param andLabel:label]];
}

+(id)EEIPadAppConfig
{
    AppConfig *cfg = [[AppConfig alloc]init];

    [cfg addSmallWidget:@"VideoWidget" withLabel:@"Video"];
    [cfg addSmallWidget:@"SingleQuotesViewController" withParameter:@"IndicesUpdate" withLabel:@"Indices" ];
    [cfg addSmallWidget:@"SingleQuotesViewController" withParameter:@"CommoditesUpdate" withLabel:@"Commodites" ];
    [cfg addSmallWidget:@"SingleQuotesViewController" withParameter:@"StocksUpdate" withLabel:@"Stocks" ];

    //[cfg addSmallWidget:@"QuotesViewController" withLabel:@"Quotes"];
    [cfg addSmallWidget:@"StocksWidget" withLabel:@"Futures"];
    [cfg addSmallWidget:nil withLabel:@"Indicies"];    
    [cfg addSmallWidget:nil withLabel:@"Stock Quotes"];
    cfg.smalScrollView = [[ScrollViewConfig alloc] initWithNumOfWidgets:2 andViewWidth:314];
    
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"spotlight" withLabel:@"Spotlight"];
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"newsandanalysis" withLabel:@"News & Analysis"];
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"latestdeal" withLabel:@"Latest Deal"];
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"onetowatch" withLabel:@"One To Watch"];
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"companyfocus" withLabel:@"Company Focus"];
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"countryrisk" withLabel:@"Country Rick"];
    [cfg addLargeWidget:@"CategoryArticlesWidget" withParameter:@"powergeneration" withLabel:@"Power Generation"];

//http://qaeei.ihsglobalinsight.com/energy/IPadArticle/GetLatest?categoryName=latestdeal
//    newsandanalysis,spotlight,onetowatch,companyfocus,countryrisk,powergeneration
    
    cfg.largeScrollView = [[ScrollViewConfig alloc] initWithNumOfWidgets:1 andViewWidth:649];
    
    return cfg;
}


@end
