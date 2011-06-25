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
@optional
-(void) requestFailed:(NSString*) errMsg;
-(id) convertData:(NSData *)result fromResponse: (NSURLResponse *) response;
@end


typedef enum {
    WebRequestPriorityLow, WebRequestPriorityUrgent
} WebRequestPriority;


@interface WebRequest : NSObject {
	NSURL* url;
	id<WebRequestDelegate> delegate;
    WebRequestPriority _priority;
    NSString *_method;
}
@property (assign) id<WebRequestDelegate> delegate;

+(NSOperationQueue *) sharedQueue;

- (id)initWithURL:(NSURL *)targetUrl andMethod:(NSString *)method;

- (id)initWithURLString:(NSString *)requestURL;
- (id)initWithURLStringAndLowPriority:(NSString *)requestURL;

- (id)initWithURLAndLowPriority:(NSURL *)target;

- (WebRequest *)initWithURL:(NSURL *)target;
-(void) makeRequest;

- (void)makeRequest:(NSData *)httpBody;


@end