//
//  QuotesModel.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesModel.h"
#import "QuotesCategory.h"


@implementation QuotesModel
@synthesize Indices, Commodities, Stocks;
-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        NSArray *categories = [dictionary objectForKey:@"tabs"];
        [categories enumerateObjectsUsingBlock:^(id object, NSUInteger idx, BOOL *stop) 
        {
            NSString *categoryName = [[NSString alloc] initWithString:[object objectForKey:@"category"]];
            QuotesCategory *category = [[QuotesCategory alloc]
                    initWithCategory:categoryName 
                    withQuotes:[object objectForKey:@"symbols"]];
            [self setValue:category forKey:categoryName];
            [category release];
        }];
    }
    return self;
    
}
-(NSString *) lastUpdate
{
    NSDate *lastUpdateDate = Indices.lastUpdate;
    if([Commodities.lastUpdate laterDate:lastUpdateDate])
    {
        lastUpdateDate = Commodities.lastUpdate;
    }
    if([Stocks.lastUpdate laterDate:lastUpdateDate])
    {
        lastUpdateDate = Stocks.lastUpdate;
    }
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy'-'MM'-'dd HH':'mm':'ss"];
    NSString *stringFromDate = [formatter stringFromDate:lastUpdateDate];
    [formatter release];
    return stringFromDate;
}

-(void)dealloc
{
    [Indices release], Indices = nil;
    [Commodities release], Commodities = nil;
    [Stocks release], Stocks = nil;
    [super dealloc];
}
@end
