//
//  ScrollViewConfig.h
//  EEIPad
//
//  Created by Worker on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ScrollViewConfig : NSObject {
    int widgetsPerPage;
    int widgetWidth;
    
}

@property (readwrite) int widgetsPerPage;
@property (readwrite) int widgetWidth;

- (id) initWithNumOfWidgets: (int) widgetsPerPage andViewWidth: (int) widgetWidth;
@end
