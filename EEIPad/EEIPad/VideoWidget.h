//
//  VideoWidget.h
//  EEIPad
//
//  Created by Worker on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIViewController.h>
#import <MediaPlayer/MediaPlayer.h>
#import "WebRequest.h"


@interface VideoWidget : UIViewController<WebRequestDelegate>{
    
    UIView *videoView;
    MPMoviePlayerController *player;
@private
    UILabel *_duration;
    UILabel *_people;
    UILabel *_date;
    UILabel *_videoTitle;
    WebRequest *_webRequest;
    UIActivityIndicatorView *_activityIndicator;
}
@property (nonatomic, retain) IBOutlet UIView *videoView;

@property (retain, nonatomic) IBOutlet UILabel *date;
@property (retain, nonatomic) IBOutlet UILabel *videoTitle;
@property (retain, nonatomic) IBOutlet UILabel *people;
@property (retain, nonatomic) IBOutlet UILabel *duration;


@end
