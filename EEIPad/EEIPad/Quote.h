//
//  Quote.h
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Quote : NSObject {
    NSString *name;
    float price;
    float change;
    float changePercent;
    NSDate *lastUpdate;
}
@property (readonly) NSString *name;
@property (readonly) NSString *price;
@property (readonly) NSString *change;
@property (readonly) NSString *changePercent;
@property (readonly) NSDate *lastUpdate;
-(id)initWithDictionary:(NSDictionary*)dictionary;
-(BOOL)isNegativeChange;
@end
