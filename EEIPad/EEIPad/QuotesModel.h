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
@private
    QuotesCategory *_indices;
    QuotesCategory *_commodities;
    QuotesCategory *_stocks;
}
@property (retain) QuotesCategory *Indices;
@property (retain) QuotesCategory *Commodities;
@property (retain) QuotesCategory *Stocks;
@property (readonly) NSString *lastUpdate;
-(id)initWithDictionary:(NSDictionary*)dictionary;
@end
