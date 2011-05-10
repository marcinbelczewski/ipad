//
//  EEIPad_LogicTests.m
//  EEIPad.LogicTests
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "when_initializing_quote.h"
#import "QuoteDictionaryBuilder.h"

@implementation when_initializing_quote

- (void)setUp
{
    [super setUp];
    
    QuoteDictionaryBuilder *builder = [[QuoteDictionaryBuilder alloc] init];
    builder.name = @"DJIA";
    builder.datetime = @"2011-05-06T16:30:18-04:00";
    builder.price = @"12638.74768";
    builder.change = @"54.57123";
    builder.changePercent = @"0.431111";
    NSDictionary *dictionary = [builder build];
    quote = [[Quote alloc] initWithDictionary:dictionary];
    [dictionary release];
    [builder release];
}

- (void)tearDown
{
    [quote release];
    
    [super tearDown];
}

- (void)test_name_should_be_initialized
{
    STAssertEquals(quote.name, @"DJIA",@"name should be initialized");
}
- (void)test_lastupdate_should_be_initialized
{
    STAssertNotNil(quote.lastUpdate, @"price should be initialized");
}
- (void)test_price_should_be_initialized_and_formatted
{
    STAssertEqualObjects(quote.price, @"12638.75",@"price should be initialized");
}

- (void)test_change_should_be_initialized_and_formatted
{
    STAssertEqualObjects(quote.change, @"54.57",@"change should be initialized");
}

- (void)test_change_percent_should_be_initialized_and_formatted
{
    STAssertEqualObjects(quote.changePercent, @"0.43",@"change percent should be initialized");
}

@end
