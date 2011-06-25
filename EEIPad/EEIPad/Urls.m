//
//  Created by piotrmionskowski on 6/25/11.
//
//


#import "Urls.h"


@implementation Urls

static NSString* BASE_URL = @"http://qaeei.ihsglobalinsight.com/energy/" ;

+(NSURL *)relative:(NSString *)relative {
    return [NSURL URLWithString:relative relativeToURL:[NSURL URLWithString:BASE_URL]];
}

+ (NSURL *)defaultPrices {
    return [Urls relative: @"IPadArticle/DefaultPrices"];
}

+ (NSURL *)authenticate {
    return [Urls relative: @"Account/LogOn"];
}

+(NSURL *) homeArticles {
    id addres = [NSString stringWithFormat:@"IPadArticle/GetLatest?categoryName=%@",
            @"onetowatch"];
    return [Urls relative:addres];
}

+ (NSURL *)latestVideo {
    return [Urls relative: @"IPadArticle/LatestVideo"];
}

+ (NSURL *)articlesByCategory:(NSString *)category {
    return [Urls relative:[NSString stringWithFormat:@"IPadArticle/GetLatest?categoryName=%@",category]];
}

+ (NSURL *)articleById:(NSInteger)articleId {
    return [Urls relative:[NSString stringWithFormat:@"IPadArticle/GetById?id=%d",articleId]];
}
@end