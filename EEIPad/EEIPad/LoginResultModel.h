//
//  Created by piotrmionskowski on 6/25/11.
//
//


#import <Foundation/Foundation.h>


@interface LoginResultModel : NSObject {

@private
    NSString *_errorMessage;
    BOOL _success;
}

-initWithResponse:(NSURLResponse *)response;

@property(readonly) BOOL success;
@property(readonly) NSString *errorMessage;


@end