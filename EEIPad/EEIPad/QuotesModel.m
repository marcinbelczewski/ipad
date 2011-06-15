//
//  QuotesModel.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesModel.h"


@implementation QuotesModel
@synthesize Indices = _indices, Commodities = _commodities, Stocks = _stocks;
-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        NSArray *categories = [dictionary objectForKey:@"tabs"];
        for (NSDictionary *object in categories) {
            NSString *categoryName = [object objectForKey:@"category"];
            QuotesCategory *category = [[QuotesCategory alloc]
                    initWithCategory:categoryName
                    withQuotes:[object objectForKey:@"symbols"]];
            [self setValue:category forKey:categoryName];
            [category release];
        }
    }
    return self;
    
}
-(NSString *) lastUpdate
{
    NSDate *lastUpdateDate = _indices.lastUpdate;
    if([_commodities.lastUpdate laterDate:lastUpdateDate])
    {
        lastUpdateDate = _commodities.lastUpdate;
    }
    if([_stocks.lastUpdate laterDate:lastUpdateDate])
    {
        lastUpdateDate = _stocks.lastUpdate;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy'-'MM'-'dd HH':'mm':'ss"];
    NSString *stringFromDate = [formatter stringFromDate:lastUpdateDate];
    [formatter release];
    return stringFromDate;
}

-(void)dealloc
{
    [_stocks release];
    [_commodities release];
    [_indices release];
    [super dealloc];
}
@end
