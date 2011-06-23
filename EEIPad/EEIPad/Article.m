//
//  Article.m
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Article.h"
#import "NSDate+FromJsonDate.h"

@implementation Article

@synthesize identifier,title;
@synthesize date = _date;


-(id)initWithDictionary:(NSDictionary*)dictionary
{
    self = [super init];
    
    if (self != nil)
    {
        id cos = [dictionary objectForKey:@"DocumentId"];
        self->identifier = [[dictionary objectForKey:@"DocumentId"] integerValue];
        self->title = [[NSString alloc] initWithString:[dictionary objectForKey:@"Title"]];
        NSDate *date = [NSDate dateFromJsonDate:[dictionary objectForKey:@"PublishDate"]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
       
        self->_date= [[formatter stringFromDate:date] retain];
    }
    return self;
    
}

@end
