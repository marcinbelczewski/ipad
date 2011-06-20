//
//  WebRequest.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebRequestDelegate
-(void) dataLoaded:(id)data;
-(void) requestFailed:(NSString*) errMsg;
@end


typedef enum {
    WebRequestPriorityLow, WebRequestPriorityUrgent
} WebRequestPriority;


@interface WebRequest : NSObject {
	NSString* url;
	id<WebRequestDelegate> delegate;
    WebRequestPriority _priority;
}
@property (assign) id<WebRequestDelegate> delegate;

+(NSOperationQueue *) sharedQueue;

- (id)initWithURLString:(NSString *)requestURL;
- (id)initWithURLStringAndLowPriority:(NSString *)requestURL;
-(void) makeRequest;


@end