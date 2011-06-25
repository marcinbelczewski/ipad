//
//  VideoWidget.m
//  EEIPad
//
//  Created by Worker on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WebRequest.h"
#import "VideoWidget.h"
#import "VideoModel.h"
#import "UIView+ShowActivityIndicator.h"
#import "UIViewController+ShowActivityIndicator.h"
#import "Urls.h"

@implementation VideoWidget
@synthesize videoView;
@synthesize duration = _duration;
@synthesize people = _people;
@synthesize date = _date;
@synthesize videoTitle = _videoTitle;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _webRequest = [[WebRequest alloc] initWithURLAndLowPriority:[Urls latestVideo]];
        _webRequest.delegate = self;
    }
    return self;
}

- (void)dealloc
{
    [player release];
    [videoView release];
    [_duration release];
    [_people release];
    [_date release];
    [_videoTitle release];
    [_webRequest release];
    [_activityIndicator release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showActivity];
    player = [[MPMoviePlayerController alloc] init];
    player.controlStyle = MPMovieControlStyleEmbedded;
    [player.view setFrame: videoView.bounds];  // player's frame must match parent's
    [videoView addSubview: player.view];
    [_webRequest makeRequest];
}

- (void)viewDidUnload
{
    [self setVideoView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (void)requestFailed:(NSString *)errMsg {
}

- (void)dataLoaded:(id)data {
    [self hideActivity];
    NSDictionary *dictionary = data;
    VideoModel * videoModel = [[VideoModel alloc] initWithDictionary:dictionary];

    self.videoTitle.text = videoModel.title;
    self.duration.text = videoModel.duration;
    self.people.text = videoModel.starring;
    self.date.text = videoModel.date;
    player.contentURL = videoModel.videoUrl;
    [player stop];
    [videoModel release];
}

-(UIView *)activityParent {
    return self.view.superview;
}


@end
