//
//  DetailViewController.m
//  SplitViewTest1
//
//  Created by Worker on 4/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "AppConfig.h"
#import "UIViewScrollContainer.h"
#import <QuartzCore/QuartzCore.h>

@implementation DetailViewController



@synthesize toolbar=_toolbar;
@synthesize upperContainer;
@synthesize lowerContainer;


- (void)configureView
{
    // Update the user interface for the detail item.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppConfig *config = [AppConfig EEIPadAppConfig];
    [self.upperContainer setupWithWidgets:config.smallWidgets andConfig:config.smalScrollView];
    [self.lowerContainer setupWithWidgets:config.largeWidgets andConfig:config.largeScrollView];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.contentsRect= gradient.frame = CGRectMake(0.0, 0.0, 1024.0, 1024.0);
    id colorA = [[UIColor alloc]initWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0];
    id colorB = [[UIColor alloc]initWithRed:140.0/255.0 green:140.0/255.0 blue:140.0/255.0 alpha:1.0];
    
    gradient.colors = [NSArray arrayWithObjects:(id)[colorA CGColor], (id)[colorB CGColor], nil];
    gradient.shouldRasterize = YES;
    gradient.contentsGravity = kCAGravityResize;
    [self.view.layer insertSublayer:gradient atIndex:0];

}

- (void)viewDidUnload
{
	[super viewDidUnload];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)dealloc
{
    [_toolbar release];
    [upperContainer release];
    [lowerContainer release];
    [super dealloc];
}
- (IBAction)trashAction:(id)sender {
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [anim setToValue:[NSNumber numberWithFloat:0.0f]];
    [anim setFromValue:[NSNumber numberWithDouble:M_PI/64]];
    [anim setDuration:0.1];
    [anim setRepeatCount:NSUIntegerMax];
    [anim setAutoreverses:YES];
    
    [self.upperContainer.scrollManager.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(obj!=[NSNull null])
        {
            UIViewController *vc = (UIViewController *)obj;
            [vc.view.layer addAnimation:anim forKey:@"SpringboardShake"];
        }
    } ];
    [self.lowerContainer.scrollManager.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(obj!=[NSNull null])
        {
            UIViewController *vc = (UIViewController *)obj;
            [vc.view.layer addAnimation:anim forKey:@"SpringboardShake"];
        }
    }];
    
}

- (IBAction)doneAction:(id)sender {
    [self.upperContainer.scrollManager.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(obj!=[NSNull null])
        {
            UIViewController *vc = (UIViewController *)obj;
            [vc.view.layer removeAnimationForKey:@"SpringboardShake"];
        }
    } ];
    [self.lowerContainer.scrollManager.viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(obj!=[NSNull null])
        {
            UIViewController *vc = (UIViewController *)obj;
            [vc.view.layer removeAnimationForKey:@"SpringboardShake"];
        }
    }];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [[self.lowerContainer scrollManager] collapseWidgets];
    if ((toInterfaceOrientation==UIInterfaceOrientationLandscapeLeft)||(toInterfaceOrientation==UIInterfaceOrientationLandscapeRight)) {
        [UIView animateWithDuration:duration     
                         animations:^{
                             [self.upperContainer setFrame:CGRectMake(self.upperContainer.frame.origin.x, -self.upperContainer.frame.size.height, upperContainer.frame.size.width, upperContainer.frame.size.height)];                         
                             [self.lowerContainer setFrame:CGRectMake(60.0, 60.0, 1024.0-60.0, 768.0-120.0)];                         
                             [self.lowerContainer.scrollManager resizeWidgetsWithWidth:1024-120 andDuration:duration];
                         }
                         completion:^(BOOL finished) {
                             [self.lowerContainer.pageControl setNeedsLayout];
                             [self.lowerContainer.pageControl setNeedsDisplay];
                         }];
        }
        else
        {
            [UIView animateWithDuration:duration     
                             animations:^{
                                 [self.upperContainer setFrame:CGRectMake(self.upperContainer.frame.origin.x, 60, upperContainer.frame.size.width, upperContainer.frame.size.height)];                         
                                 [self.lowerContainer setFrame:CGRectMake(60.0, 425.0, 768.0-60.0, 544.0)];                         
                                 [self.lowerContainer.scrollManager resizeWidgetsWithWidth:768-120 andDuration:duration];
                             }
                             completion:^(BOOL finished) {
                                 [self.lowerContainer.pageControl setNeedsLayout];
                                 [self.lowerContainer.pageControl setNeedsDisplay];
                             }];
            
        }
}
@end
