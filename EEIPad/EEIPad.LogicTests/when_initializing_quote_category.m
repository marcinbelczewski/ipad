//
//  QuoteCategoryTests.m
//  EEIPad
//
//  Created by Marcin Belczewski on 5/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "when_initializing_quote_category.h"
#import "QuoteDictionaryBuilder.h"


@implementation when_initializing_quote_category
- (void)setUp
{
    [super setUp];
    
    NSMutableArray *array =  [[NSMutableArray alloc] initWithObjects:
                                            [[[QuoteDictionaryBuilder alloc] init] build],
                                            [[[QuoteDictionaryBuilder alloc] init] build],                                              
                                         nil];                                        
                                        
                                        
                                        
    quotesCategory = [[QuotesCategory alloc] initWithCategory:@"Indices" withQuotes:array];
}

- (void)tearDown
{
    [quotesCategory release];
    
    [super tearDown];
}


- (void)test_category_should_be_initialized {
    
    STAssertEqualObjects(quotesCategory.category, @"Indices", @"Category should be initialized");
    
}
- (void)test_symbols_should_be_initialized {
    
    int sCount = [quotesCategory.quotes count];
    STAssertEquals(sCount,2,@"Symbols should be initialized");
    
}
@end
