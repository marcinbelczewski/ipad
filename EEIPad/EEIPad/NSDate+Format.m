//
//  Created by piotrmionskowski on 5/23/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "NSDate+Format.h"


@implementation NSDate(Formatting)

- (NSString *)stringWithDateAndTime {
     NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy'-'MM'-'dd HH':'mm':'ss"];
    NSString *stringFromDate = [formatter stringFromDate:self];
    [formatter release];
    return stringFromDate;
}
@end