//
//  Created by piotrmionskowski on 5/14/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "WebRequest.h"
#import "QuotesService.h"
#import "QuotesModel.h"
#import "JSONKit.h"

@implementation QuotesService


- (id)initWithUrl:(NSURL *)dataUrl {
    self = [super init];
    if (self) {
        _dataUrl = [dataUrl retain];
        _webRequest = [[WebRequest alloc] initWithURLString:@"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/DefaultPrices"];
        _webRequest.delegate = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:5.0
                                             target:self
                                           selector:@selector(refreshQuotes)
                                           userInfo:nil
                                            repeats:YES];
        [self refreshQuotes];
    }

    return self;
}

-(void)refreshQuotes
{
    [_webRequest makeRequest];
}

- (void)requestFailed:(NSString *)errMsg {
}

-(void) dataLoaded:(NSData*)data
{
    NSDictionary *dictionary = [data objectFromJSONData];
    QuotesModel *quotes = [[[QuotesModel alloc] initWithDictionary:dictionary] autorelease];
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"CommoditesUpdate" object:quotes.Commodities];
    [notificationCenter postNotificationName:@"IndicesUpdate" object:quotes.Indices];
    [notificationCenter postNotificationName:@"StocksUpdate" object:quotes.Stocks];
//    updatedLabel.text  = quotes.lastUpdate;
}

- (void)dealloc {
    [_dataUrl release];
    [_webRequest release];
    [super dealloc];  //To change body of implemented methods use File | Settings | File Templates.
}


@end