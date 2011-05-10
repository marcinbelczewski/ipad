//
//  VideoWidget.h
//  EEIPad
//
//  Created by Worker on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface VideoWidget : UIViewController {
    
    UIView *videoView;
    MPMoviePlayerController *player;
}
@property (nonatomic, retain) IBOutlet UIView *videoView;

@end
