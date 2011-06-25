//
//  Created by piotrmionskowski on 6/25/11.
//
//


#import "LoginResultModel.h"
#import "Urls.h"


@implementation LoginResultModel
@synthesize errorMessage = _errorMessage;
@synthesize success = _success;


- (id)initWithResponse:(NSURLResponse *)response {
    self = [super init];
    if (self){
        if ([[response URL] isEqual:[Urls authenticate]]){
            _success = NO;
            _errorMessage = @"Could not login. Refine your credentials and try again";
        } else {
            _success = YES;
            _errorMessage = @"";
        }
    }
    return self;
}


@end