//
//  QuotesCategory.h
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuotesCategory : NSObject {
    NSString *category;
    NSMutableArray *quotes; //Array of Quote class instances
}
@property (retain) NSString *category;
@property (retain) NSMutableArray *quotes;
@property (readonly) NSDate * lastUpdate;
-(id)initWithCategory:(NSString *)categoryName withQuotes:(NSArray*)array;
@end
