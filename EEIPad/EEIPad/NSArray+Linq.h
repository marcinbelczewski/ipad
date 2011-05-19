//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//


#import <Foundation/Foundation.h>


@interface NSArray(Linq)
-(id)first:(BOOL (^)(id))condition;
@end