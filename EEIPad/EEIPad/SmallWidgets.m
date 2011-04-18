//
//  SmallWidgets.m
//  EEIPad
//
//  Created by Marcin Belczewski on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SmallWidgets.h"
#import "WidgetLg.h"

@implementation SmallWidgets

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

- (UIViewController *)widgetForPage:(NSInteger)pageIndex
{
	return [widgets objectAtIndex:pageIndex];
}
-(void) dealloc
{
    [widgets release];
    [super dealloc];
}
@end
