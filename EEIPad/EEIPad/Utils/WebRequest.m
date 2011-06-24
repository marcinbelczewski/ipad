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

- (id)initWithURLString:(NSString *)requestURL andPriority:(WebRequestPriority )priority {
    if (self == [super init]) {
        url = [requestURL retain];
        _priority = priority;
    }
    return self;
}

- (id)initWithURLString:(NSString *)requestURL {
    return [self initWithURLString:requestURL andPriority: WebRequestPriorityUrgent];
}

- (id)initWithURLStringAndLowPriority:(NSString *)requestURL {
    return [self initWithURLString:requestURL andPriority:WebRequestPriorityLow];
}


- (void)performRequest {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSURLResponse *response = nil;
    NSError *error = nil;
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    app.networkActivityIndicatorVisible = ([[WebRequest sharedQueue] operationCount] > 1);
    if (error) {
        [delegate performSelectorOnMainThread:@selector(requestFailed:) withObject:[error localizedDescription] waitUntilDone:NO];
    } else {
        NSData *dataResult = [result objectFromJSONData];
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
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(performRequest)
                                                                              object:nil];
    [self setOperationPriority:operation];
    [[WebRequest sharedQueue] addOperation:operation];
    [operation release];
}

- (void)dealloc {
    [url release];
    [super dealloc];
}

@end