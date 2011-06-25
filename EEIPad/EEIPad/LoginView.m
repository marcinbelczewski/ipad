//
//  LoginView.m
//  EEIPad
//
//  Created by Piotr Mionskowski on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginView.h"


@implementation LoginView
@synthesize backgroundImage;

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
    [backgroundImage release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)updateBackgroundImage : (NSString *) imageName {
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.backgroundImage removeFromSuperview];
    self.backgroundImage = imageView;
    [self.view insertSubview:imageView atIndex:0];
}

- (void)updateBackgroundAccordingToOrientation : (UIInterfaceOrientation ) orientation {
    if ( UIInterfaceOrientationIsLandscape(orientation)){
        [self updateBackgroundImage: @"Default-Landscape~ipad.png"];
    } else {
        [self updateBackgroundImage: @"Default-Portrait~ipad.png"];
    }
}

- (void)viewDidLoad
{
    [self updateBackgroundAccordingToOrientation:self.interfaceOrientation];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setBackgroundImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self updateBackgroundAccordingToOrientation: toInterfaceOrientation];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
