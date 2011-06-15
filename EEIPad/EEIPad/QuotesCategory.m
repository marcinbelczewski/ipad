//
//  QuotesCategory.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuotesCategory.h"
#import "Quote.h"


@implementation QuotesCategory
@synthesize category, quotes;
-(id)initWithCategory:(NSString *)categoryName withQuotes:(NSArray*)array
{
    self = [super init];
    
    if (self != nil)
    {
        self->category = [categoryName retain];
        self->quotes = [[NSMutableArray alloc] init];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            Quote *quote = [[Quote alloc] initWithDictionary:obj];
            [self->quotes addObject:quote];
            [quote release];
        }];
    }
    return self;
}
-(NSDate*)lastUpdate
{
    __block NSDate* lastUpdateDate = nil;
    [quotes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Quote *quote = (Quote*)obj;
        if(lastUpdateDate==nil)
        {
            lastUpdateDate = quote.lastUpdate;
        }
        else
        {
            if([quote.lastUpdate laterDate:lastUpdateDate])
            {
                lastUpdateDate = quote.lastUpdate;
            }
        }
    }];
    return lastUpdateDate;
}
-(void)dealloc
{
    [category release], category = nil;
    [quotes release], quotes = nil;
    [super dealloc];
}
@end
