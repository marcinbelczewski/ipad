//
//  Quote.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Quote.h"


@implementation Quote
@synthesize name, lastUpdate;
-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        name = [[NSString alloc] initWithString:[dictionary objectForKey:@"name"]];
        price = [[dictionary objectForKey:@"price"] floatValue];
        change = [[dictionary objectForKey:@"change"] floatValue];
        changePercent = [[dictionary objectForKey:@"changePercent"] floatValue];
        NSString *stringDate = [dictionary objectForKey:@"datetime"];
        
        stringDate = [stringDate stringByReplacingOccurrencesOfString:@":"
                                                           withString:@""
                                                              options:0
                                                                range:NSMakeRange(20, stringDate.length-20)];
    
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ssZ"];
        lastUpdate = [[dateFormatter dateFromString:stringDate] retain];
        [dateFormatter release];
    }
    return self;
}
-(NSString *) price
{
    return [NSString stringWithFormat:@"%0.2f",price];
}
-(NSString *) change
{
    return [NSString stringWithFormat:@"%0.2f",change];
}
-(NSString *) changePercent
{
    return [NSString stringWithFormat:@"%0.2f",changePercent];
}
-(BOOL)isNegativeChange
{
    return change<0.0f;
}

-(void)dealloc
    {
        [name release], name = nil;
        [lastUpdate release], lastUpdate = nil;
        [super dealloc];
    }
@end
