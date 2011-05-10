//
//  QuoteBuilder.h
//  EEIPad
//
//  Created by Marcin Belczewski on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quote.h"

@interface QuoteDictionaryBuilder : NSObject {
    NSString *name;
    NSString *price;
    NSString *change;
    NSString *changePercent;
    NSString *datetime;
}
@property (retain) NSString *name;
@property (retain) NSString *price;
@property (retain) NSString *change;
@property (retain) NSString *changePercent;
@property (retain) NSString *datetime;
-(NSDictionary*)build;
@end
