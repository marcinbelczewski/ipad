//
//  WidgetConfig.m
//  EEIPad
//
//  Created by Worker on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WidgetConfig.h"
#import "Widget.h"

@implementation WidgetConfig

@synthesize widgetClass,label,widgetContainerClass,widgetRect;

-(id)initSmWithClass:(NSString*)widgetClass andLabel:(NSString*)label
{
    self = [super init];
    
    if (self) {
        
        self.widgetClass= widgetClass;
        [self setLabel: label];
        self.widgetContainerClass = @"WidgetSm";
        self.widgetRect = CGRectMake(6, 31, 312, 298);
        
    }
    
    return self;
}

-(id)initLgWithClass:(NSString*)widgetClass andLabel:(NSString*)label
{
    self = [super init];
    
    if (self) {
        
        [self setWidgetClass: widgetClass];
        [self setLabel: label];
        self->widgetContainerClass = @"WidgetLg";
        self.widgetRect = CGRectMake(6, 38, 647, 470);
        
    }
    
    return self;
}

-(id) instantiateWidget
{
    Widget *instance = [[NSClassFromString(widgetContainerClass) alloc] init];
    [instance configureWith: self];
    if (widgetClass!=nil) {
        instance.subView = [[NSClassFromString(widgetClass) alloc] init];
    }
    return instance;
}
@end
