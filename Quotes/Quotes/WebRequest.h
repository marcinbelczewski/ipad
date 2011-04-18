//
//  WebRequest.h
//  Quotes
//
//  Created by Marcin Belczewski on 4/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WebRequestDelegate
-(void) dataLoaded:(NSData*)data;
-(void) requestFailed:(NSString*) errMsg;
@end

@interface WebRequest : NSObject {
	NSString* url;
	NSURLConnection *urlConnection;
	id<WebRequestDelegate> delegate;
	NSMutableData* data;
}
@property (assign) id<WebRequestDelegate> delegate;

-(id) initWithURL:(NSString*)requestURL;
-(void) makeRequest;
-(void) cancelRequest;
@end
