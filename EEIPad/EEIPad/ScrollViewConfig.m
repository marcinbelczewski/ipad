//
//  ScrollViewConfig.m
//  EEIPad
//
//  Created by Worker on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollViewConfig.h"


@implementation ScrollViewConfig

@synthesize widgetsPerPage;
@synthesize widgetWidth;

-(id)initWithNumOfWidgets:(int)widgetsPerPage andViewWidth:(int)widgetWidth
{
    self = [super init];
    
    if (self) {
        [self setWidgetsPerPage:widgetsPerPage];
        [self setWidgetWidth:widgetWidth];
    }
    
    return self;
}
@end
