//
//  LargeWidgets.m
//  EEIPad
//
//  Created by Marcin Belczewski on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LargeWidgets.h"
#import "WidgetLg.h"


@implementation LargeWidgets
- (id)init
{
	self = [super init];
	if (self != nil)
	{
		widgets = [NSArray arrayWithObjects:
                   [WidgetLg class],
                   [WidgetLg class],
                   [WidgetLg class],
                   [WidgetLg class],
                   [WidgetLg class],nil
                   ];
	}
	return self;
}
- (NSInteger)numWidgetPages
{
	return [widgets count];
}

- (NSDictionary *)widgetForPage:(NSInteger)pageIndex
{
	return [widgets objectAtIndex:pageIndex];
}
-(void) dealloc
{
    [widgets release];
}
@end
