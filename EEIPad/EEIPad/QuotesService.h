//
//  Created by piotrmionskowski on 5/14/11.
//
//  To change this template use File | Settings | File Templates.
//


#import <Foundation/Foundation.h>
#import "WebRequest.h"


@interface QuotesService : NSObject<WebRequestDelegate> {

@private
    NSTimer *_timer;
    WebRequest *_webRequest;
    NSURL *_dataUrl;
}
- (id)initWithUrl:(NSURL *)dataUrl;


@end