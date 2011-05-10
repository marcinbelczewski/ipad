//
//  QuotesModel.h
//  EEIPad
//
//  Created by Marcin Belczewski on 5/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuotesCategory.h"

@interface QuotesModel : NSObject {
    QuotesCategory *Indices;
    QuotesCategory *Commodities;
    QuotesCategory *Stocks;
}
@property (retain) QuotesCategory *Indices;
@property (retain) QuotesCategory *Commodities;
@property (retain) QuotesCategory *Stocks;
@property (readonly) NSString *lastUpdate;
-(id)initWithDictionary:(NSDictionary*)dictionary;
@end
