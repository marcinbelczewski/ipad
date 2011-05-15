//
//  Created by piotrmionskowski on 5/15/11.
//
//  To change this template use File | Settings | File Templates.
//


#import "VideoModel.h"
#import "NSDate+FromJsonDate.h"



@implementation VideoModel

@synthesize title = _title;
@synthesize duration = _duration;
@synthesize starring = _starring;
@synthesize date = _date;
@synthesize videoUrl = _videoUrl;


- (id)initWithDictionary: (NSDictionary *) dict {
    self = [super init];
    if (self) {
        NSDictionary * document = [dict objectForKey:@"Document"];
        _title = [document objectForKey:@"Title"];
        _starring = [document objectForKey:@"Summary"];
        NSDate * date = [NSDate dateFromJsonDate:[document objectForKey:@"LastChangeDate"]];
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init] ;
        formatter.dateFormat = @"yyyy'-'MM'-'dd'T'HH':'mm':'ssZ";
        _date = [formatter stringFromDate:date];
        _duration = [dict objectForKey:@"Duration"];
        _videoUrl = [NSURL URLWithString:[dict objectForKey:@"VideoUrl"]];
        [formatter release];
    }

    return self;
//To change body of implemented methods use File | Settings | File Templates.
}

- (void)dealloc {

    [super dealloc];  //To change body of implemented methods use File | Settings | File Templates.
}


@end