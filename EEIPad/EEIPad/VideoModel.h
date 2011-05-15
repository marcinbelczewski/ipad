//
//  Created by piotrmionskowski on 5/15/11.
//
//  To change this template use File | Settings | File Templates.
//


#import <Foundation/Foundation.h>


@interface VideoModel : NSObject {

@private
    NSString *_title;
    NSString *_duration;
    NSString *_starring;
    NSString *_date;
    NSURL *_videoUrl;
}

- (id)initWithDictionary: (NSDictionary *) dict;

@property(readonly) NSString *title;
@property(readonly) NSString *duration;
@property(readonly) NSString *starring;
@property(readonly) NSString *date;
@property(readonly) NSURL *videoUrl;





@end