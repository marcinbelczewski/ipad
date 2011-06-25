//
//  Created by piotrmionskowski on 6/25/11.
//
//


#import "Urls.h"


@implementation Urls

+ (NSURL *)defaultPrices {
    return [NSURL URLWithString:@"http://qaeei.ihsglobalinsight.com/energy/IPadArticle/DefaultPrices"];
}

+ (NSURL *)authenticate {
    return [NSURL URLWithString:@"http://qaeei.ihsglobalinsight.com/energy/Account/LogOn"];
}

@end