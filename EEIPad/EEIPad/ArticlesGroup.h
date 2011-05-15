//
//  ArticlesGroup.h
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ArticlesGroup : NSObject {
    NSString *group;
    NSMutableArray *articles; //Array of Article class instances
}
@property (readwrite,copy) NSString *group;
@property (readwrite,retain) NSMutableArray *articles;
-(id)initWithDate:(NSString *)date withArticles:(NSArray*)articlesArray;
@end
