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
        _webRequest = [[WebRequest alloc] initWithURLAndLowPriority: dataUrl];
        _webRequest.delegate = self;
        _timer = [NSTimer scheduledTimerWithTimeInterval:30.0
                                                  target:self
                                                selector:@selector(refreshQuotes)
                                                userInfo:nil repeats:YES];
        [self refreshQuotes];
    }

    return self;
}

- (void)refreshQuotes {
    [_webRequest makeRequest];
}

- (void)requestFailed:(NSString *)errMsg {
}

- (void)dataLoaded:(id)data {
    //return ;
    NSDictionary *dictionary = data;
    QuotesModel *quotes = [[QuotesModel alloc] initWithDictionary:dictionary];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"CommoditesUpdate" object:quotes.Commodities];
    [notificationCenter postNotificationName:@"IndicesUpdate" object:quotes.Indices];
    [notificationCenter postNotificationName:@"StocksUpdate" object:quotes.Stocks];
    [quotes release];
}

- (void)dealloc {
    [_webRequest release];
    [super dealloc];
}


@end