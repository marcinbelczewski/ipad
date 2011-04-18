//
//  SmallWidgets.h
//  EEIPad
//
//  Created by Marcin Belczewski on 4/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmallWidgets : NSObject {
    NSArray *widgets;
}
- (NSInteger)numWidgetPages;
- (id)widgetForPage:(NSInteger)pageIndex;
@end
