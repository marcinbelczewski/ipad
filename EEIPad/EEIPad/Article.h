//
//  Article.h
//  EEIPad
//
//  Created by grzegorz.chlodzinski on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Article : NSObject {
    NSString *title;
    NSInteger identifier;

}

@property (readonly) NSInteger identifier;
@property (readonly) NSString *title;

-(id)initWithDictionary:(NSDictionary*)dictionary;

@end
