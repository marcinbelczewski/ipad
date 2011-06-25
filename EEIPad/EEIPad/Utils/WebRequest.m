//
//  WebRequest.m
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebRequest.h"
#import <Foundation/NSOperation.h>
#import <Foundation/NSThread.h>
#import "JSONKit.h"


@implementation WebRequest
@synthesize delegate;

static NSOperationQueue *requestQueue;

+ (NSOperationQueue *)sharedQueue {
    if (requestQueue == nil) {
        requestQueue = [[NSOperationQueue alloc] init];
        [requestQueue setMaxConcurrentOperationCount:5];
    }
    return requestQueue;
}


-(id) initWithURL:(NSURL *)targetUrl andMethod: (NSString *) method priority:(WebRequestPriority )priority {
     if (self == [super init]) {
        url = [targetUrl retain];
        _priority = priority;
        _method = [method retain];
    }
    return self;
}
-(id) initWithURL:(NSURL *)targetUrl andMethod: (NSString *) method {
    return [self initWithURL:targetUrl andMethod:method priority:WebRequestPriorityUrgent];
}

- (id)initWithURLString:(NSString *)requestURL andPriority:(WebRequestPriority )priority {
    return [self initWithURL:[NSURL URLWithString:requestURL] andMethod:@"GET" priority: priority];
}

- (id)initWithURLString:(NSString *)requestURL {
    return [self initWithURLString:requestURL andPriority: WebRequestPriorityUrgent];
}

- (id)initWithURLStringAndLowPriority:(NSString *)requestURL {
    return [self initWithURLString:requestURL andPriority:WebRequestPriorityLow];
}


- (WebRequest *)initWithURLAndLowPriority:(NSURL *)targetUrl {
    return [self initWithURL:targetUrl andMethod:@"GET" priority:WebRequestPriorityLow];
}


- (void)performRequest : (NSData *)httpBody {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:_method];
    if (httpBody != nil){
        [request setHTTPBody:httpBody];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    }
    NSURLResponse *response = nil;
    NSError *error = nil;
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    app.networkActivityIndicatorVisible = ([[WebRequest sharedQueue] operationCount] > 1);
    if (error) {
        [delegate performSelectorOnMainThread:@selector(requestFailed:) withObject:[error localizedDescription] waitUntilDone:NO];
    } else {
        id dataResult = nil;
        if ([delegate respondsToSelector:@selector(convertData:fromResponse:)]){
            dataResult = [delegate convertData: result fromResponse: response];
        } else {
            dataResult = [result objectFromJSONData];
        }
        [delegate performSelectorOnMainThread:@selector(dataLoaded:) withObject:dataResult waitUntilDone:NO];
    }
}

- (void)setOperationPriority:(NSInvocationOperation *)operation {
     if (_priority == WebRequestPriorityLow)  {
         [operation setQueuePriority:NSOperationQueuePriorityVeryLow];
         [operation setThreadPriority:0.1];
     }
}

- (void)makeRequest {
    [self makeRequest:nil];
}
-(void )makeRequest : (NSData *) httpBody {
     NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(performRequest:)
                                                                              object:httpBody];
    [self setOperationPriority:operation];
    [[WebRequest sharedQueue] addOperation:operation];
    [operation release];
}


- (void)dealloc {
    [_method release];
    [url release];
    [super dealloc];
}

@end