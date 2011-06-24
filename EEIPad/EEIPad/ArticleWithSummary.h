//
//  Created by worker on 6/24/11.
//
//  To change this template use File | Settings | File Templates.
//


#import <Foundation/Foundation.h>
#import "Article.h"


@interface ArticleWithSummary : Article {
    NSString *_summary;
}
@property(nonatomic, retain) NSString *summary;

-(ArticleWithSummary *)initWithDictionary:(NSDictionary*)dictionary;

@end