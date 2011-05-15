//
//  Created by piotrmionskowski on 5/15/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "NSDate+FromJsonDate.h"


@implementation NSDate(FromJsonDate)
+ (id)dateFromJsonDate:(NSString *)jsonDateString {
    return [NSDate dateWithTimeIntervalSince1970:[[jsonDateString substringWithRange:NSMakeRange(6, 10)] intValue]];
}
@end