//
//  QuotesModelTests.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "when_initializing_quote_model.h"
#import "QuoteDictionaryBuilder.h"

@implementation when_initializing_quote_model
-(void)setUp
{
    [super setUp];
    QuoteDictionaryBuilder *builder = [[QuoteDictionaryBuilder alloc] init];
    builder.datetime = @"2011-05-09T09:57:57-04:00";
    NSDictionary *quoteDict1 = [builder build];
    builder.datetime = @"2011-05-09T10:57:57-04:00";
    NSDictionary *quoteDict2 = [builder build];
    builder.datetime = @"2011-05-09T11:57:57-04:00";
    NSDictionary *quoteDict3 = [builder build];
    builder.datetime = @"2011-05-09T12:57:57-04:00";
    NSDictionary *quoteDict4 = [builder build];    
    NSDictionary * dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                 [[NSArray alloc] initWithObjects:       
                                 [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                  @"Indices", @"category",
                                 [[NSMutableArray alloc] initWithObjects:
                                  quoteDict1,
                                  quoteDict2
                                  ,nil], @"symbols",nil],
                                 [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                  @"Commodities", @"category",
                                  [[NSMutableArray alloc] initWithObjects:
                                   quoteDict3,
                                   quoteDict4
                                   ,nil], @"symbols",nil],nil], @"tabs", nil];
                                 
                                 
                                 
    quotes = [[QuotesModel alloc] initWithDictionary:dictionary];
    [dictionary release];
}
-(void)tearDown
{
    [quotes release];
    [super tearDown];
}
- (void)test_indices_should_be_initialized {
    STAssertEqualObjects(quotes.Indices.category, @"Indices", @"Indices category name should be initialized");
}

- (void)test_commodities_should_be_initialized {
    STAssertNotNil(quotes.Commodities, @"Commodities should be initialized");
}
- (void)test_lastUpdate_should_return_oldest_quote_update_date_formatted_locally {
    STAssertEqualObjects(quotes.lastUpdate, @"2011-05-09 18:57:57", @"Last update date should be initialized to oldest update date of all quotes and formatted properly");
}
@end
