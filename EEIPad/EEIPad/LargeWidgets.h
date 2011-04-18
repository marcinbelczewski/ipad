//
//  LargeWidgets.h
//  EEIPad
//
//  Created by Marcin Belczewski on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScrollManager.h"

@interface LargeWidgets : NSObject<WidgetsLibrary> {
    NSArray *widgets;
}
- (NSInteger)numWidgetPages;
- (id)widgetForPage:(NSInteger)pageIndex;
@end
