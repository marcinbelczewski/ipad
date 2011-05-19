//
//  Created by piotrmionskowski on 5/19/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "NSArray+Linq.h"


@implementation NSArray(Linq)

- (id)first:(BOOL (^)(id))condition {
    id result = nil;
    for (id item in self) {
        if (condition(item)){
            result = item;
            break;
        }
    }
    return result;
}
@end