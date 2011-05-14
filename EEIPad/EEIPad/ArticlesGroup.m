//
//  ArticlesGroup.m
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ArticlesGroup.h"
#import "Article.h"

@implementation ArticlesGroup
@synthesize articles,group;

-(id)initWithDate:(NSString *)date withArticles:(NSArray *)articlesArray
{
    self = [super init];
    if(self!=nil)
    {
        self->group = date;
        self->articles = [[NSMutableArray alloc] init];

        [articlesArray enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        
            [self->articles addObject:[[Article alloc] initWithDictionary: (NSDictionary *)key]];
        }];

    }
    return self;
}
@end
