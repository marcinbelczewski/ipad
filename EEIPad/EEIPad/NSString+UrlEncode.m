//
//  Created by piotrmionskowski on 6/25/11.
//
//


#import "NSString+UrlEncode.h"


@implementation NSString(UrlEncode)

- (NSString *)urlEncoded {
    return [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
			   (CFStringRef)self,
			   NULL,
			   (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
			   CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)) autorelease];
}
@end