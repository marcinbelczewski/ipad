//
//  QuoteBuilder.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuoteDictionaryBuilder.h"


@implementation QuoteDictionaryBuilder
@synthesize name, price, change, changePercent, datetime;
-(id) init
{
    self = [super init];
    if (self != nil)
    {
        name = @"DJIA";
        price = @"123.567";
        change = @"12.123";
        changePercent = @"1.3456";
        datetime = @"2011-05-09T09:57:57-04:00";
    }
    return self;
}
-(NSDictionary*)build
{
    return [[NSMutableDictionary alloc] initWithObjectsAndKeys:
     name, @"name",
     datetime,@"datetime",
     price,@"price",
     change,@"change",
     changePercent,@"changePercent",
     nil];
}
@end
