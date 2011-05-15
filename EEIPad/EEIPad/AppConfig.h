//
//  AppConfig.h
//  EEIPad
//
//  Created by Worker on 4/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScrollViewConfig;

@interface AppConfig : NSObject {
    NSMutableArray *smallWidgets;
    NSMutableArray *largeWidgets;
    ScrollViewConfig *smalScrollView;
    ScrollViewConfig *largeScrollView;
}

@property (readwrite,retain) NSMutableArray *smallWidgets;
@property (readwrite,retain) NSMutableArray *largeWidgets;
@property (readwrite,retain) ScrollViewConfig *smalScrollView;
@property (readwrite,retain) ScrollViewConfig *largeScrollView;


- (void) addSmallWidget: (NSString*) name withLabel: label;
- (void) addLargeWidget: (NSString*) name withLabel: label;
- (void)addLargeWidget:(NSString *)name withParameter:(NSString*)param withLabel:(id)label;
- (void)addSmallWidget:(NSString *)name withParameter:(NSString*)param withLabel:(id)label;
+ (id) EEIPadAppConfig;
@end
