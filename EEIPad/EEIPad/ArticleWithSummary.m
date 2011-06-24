//
//  Created by worker on 6/24/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "ArticleWithSummary.h"
#import "Article.h"


@implementation ArticleWithSummary
@synthesize summary = _summary;


- (ArticleWithSummary *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self)
    {
        self->_summary = [[NSString alloc] initWithString:[dictionary objectForKey:@"Summary"]];
    }
    return self;
}

- (void)dealloc {
    [_summary release];
    [super dealloc];
}
@end