//
//  Created by piotrmionskowski on 6/25/11.
//
//


#import <Foundation/Foundation.h>


@interface Urls : NSObject {

}
+(NSURL *) defaultPrices;
+(NSURL *) authenticate;

+ (NSURL *)homeArticles;

+ (NSURL *)latestVideo;

+ (NSURL *)articlesByCategory:(NSString *)category;

+ (NSURL *)articleById:(NSInteger)articleId;
@end