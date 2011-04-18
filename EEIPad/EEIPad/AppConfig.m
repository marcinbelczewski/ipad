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

+(id)EEIPadAppConfig
{
    AppConfig *cfg = [[AppConfig alloc]init];
     
    [cfg addSmallWidget:@"StocksWidget" withLabel:@"Futures"];
    [cfg addSmallWidget:nil withLabel:@"Indicies"];    
    [cfg addSmallWidget:nil withLabel:@"Stock Quotes"];
    [cfg addSmallWidget:nil withLabel:@"Video"];
    cfg.smalScrollView = [[ScrollViewConfig alloc] initWithNumOfWidgets:2 andViewWidth:324];
    
    [cfg addLargeWidget:nil withLabel:@"Spotlight"];
    [cfg addLargeWidget:@"NewsAndAnalysisWidget" withLabel:@"News & Analysis"];    
    [cfg addLargeWidget:nil withLabel:@"Latest Deal"];
    
    cfg.largeScrollView = [[ScrollViewConfig alloc] initWithNumOfWidgets:1 andViewWidth:659];
    
    return cfg;
}
@end
