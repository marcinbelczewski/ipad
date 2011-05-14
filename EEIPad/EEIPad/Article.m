//
//  Article.m
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Article.h"


@implementation Article

@synthesize identifier,title;

-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        id cos = [dictionary objectForKey:@"DocumentId"];
        self->identifier = [[dictionary objectForKey:@"DocumentId"] integerValue];
        self->title = [[NSString alloc] initWithString:[dictionary objectForKey:@"Title"]];
    }
    return self;
    
}

@end
