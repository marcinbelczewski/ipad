//
//  VideoWidget.m
//  EEIPad
//
//  Created by Worker on 4/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "VideoWidget.h"


@implementation VideoWidget
@synthesize videoView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [videoView release];
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
    // Do any additional setup after loading the view from its nib.
    MPMoviePlayerController *player = [[MPMoviePlayerController alloc] 
                                       initWithContentURL: [NSURL URLWithString:@"http://eeivid.exec-insider.com/PROD_VIDEO/2011_04_28_Mandell1.mp4"]];
    player.controlStyle = MPMovieControlStyleEmbedded;
    [player.view setFrame: videoView.bounds];  // player's frame must match parent's
    [videoView addSubview: player.view];
    [player play];
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

@end
