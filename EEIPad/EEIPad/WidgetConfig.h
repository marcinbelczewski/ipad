//
//  WidgetConfig.h
//  EEIPad
//
//  Created by Worker on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WidgetConfig : NSObject {
    NSString * widgetContainerClass;
    NSString * widgetClass;
    CGRect widgetRect;
}

@property (readwrite,retain) NSString* label;
@property (readwrite,retain) NSString* parameter;
@property (readwrite,retain) NSString* widgetClass;
@property (readwrite,retain) NSString* widgetContainerClass;
@property (readwrite) CGRect widgetRect;

- (id) initLgWithClass: (NSString*) widgetClass andLabel: (NSString*) label;
- (id) initLgWithClass: (NSString*) widgetClass andParameter:(NSString*) parameter andLabel: (NSString*) label;
- (id) initSmWithClass: (NSString*) widgetClass andLabel: (NSString*) label;
- (id) initSmWithClass: (NSString*) widgetClass andParameter:(NSString*) parameter andLabel: (NSString*) label;

- (id) instantiateWidget;

@end
