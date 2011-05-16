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

@synthesize widgetClass,label,widgetContainerClass,widgetRect,parameter;

-(id)initSmWithClass:(NSString*)widgetClass andParameter:(NSString*)parameter andLabel:(NSString*)label
{
    self = [self initSmWithClass:widgetClass andLabel:label];
    
    if (self) {
        [self setParameter: parameter];        
    }
    
    return self;
}

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
        self.widgetRect = CGRectMake(1, 35, 647, 471);
        
    }
    
    return self;
}

-(id)initLgWithClass:(NSString*)widgetClass andParameter:(NSString*) parameter andLabel:(NSString*)label
{
    self = [self initLgWithClass:widgetClass andLabel:label];
    
    if (self) {
        [self setParameter: parameter];        
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
