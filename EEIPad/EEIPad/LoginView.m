//
//  LoginView.m
//  EEIPad
//
//  Created by Piotr Mionskowski on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginView.h"
#import "WebRequest.h"
#import "Urls.h"
#import "WebRequest.h"
#import "WebRequest.h"
#import "NSString+UrlEncode.h"
#import "LoginResultModel.h"


@implementation LoginView
@synthesize signInButton;
@synthesize backgroundImage;
@synthesize errorText;
@synthesize username;
@synthesize password;
@synthesize delegate = _delegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)dealloc {
    [backgroundImage release];
    [username release];
    [password release];
    [signInButton release];
    [_loginRequest release];
    [errorText release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)updateBackgroundImage :(NSString *)imageName {
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [self.backgroundImage removeFromSuperview];
    self.backgroundImage = imageView;
    [self.view insertSubview:imageView atIndex:0];
}

- (void)updateBackgroundAccordingToOrientation :(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        [self updateBackgroundImage:@"Default-Landscape~ipad.png"];
    } else {
        [self updateBackgroundImage:@"Default-Portrait~ipad.png"];
    }
}

- (void)viewDidLoad {
    _loginRequest = [[WebRequest alloc] initWithURL:[Urls authenticate] andMethod:@"POST"];
    _loginRequest.delegate = self;
    [self updateBackgroundAccordingToOrientation:self.interfaceOrientation];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload {
    [self setBackgroundImage:nil];
    [self setUsername:nil];
    [self setPassword:nil];
    [self setSignInButton:nil];
    [self setErrorText:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self updateBackgroundAccordingToOrientation:toInterfaceOrientation];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}


- (IBAction)tryLogin {
    if (self.signInButton.enabled == NO){
        return ;
    }
    NSString *parameters = [NSString stringWithFormat:@"UserName=%@&Password=%@",
            [self.username.text urlEncoded],
            [self.password.text urlEncoded]];
    NSData *body = [NSData dataWithBytes:[parameters UTF8String] length:[parameters length]];
    [_loginRequest makeRequest:body];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    if (textField == self.username) {
        [self.password becomeFirstResponder];
    }
}


- (IBAction)credentialChanged:(id)sender {
    if ([self.password.text length] && [self.username.text length]) {
        self.signInButton.enabled = YES;
    } else {
        self.signInButton.enabled = NO;
    }
}

- (id)convertData:(NSData *)result fromResponse: (NSURLResponse *) response{
    return [[[LoginResultModel alloc] initWithResponse:response] autorelease];
}


- (void)dataLoaded:(id)data {
   LoginResultModel * loginResult = data;
   self.errorText.text = loginResult.errorMessage;
   if (loginResult.success){
       [self.delegate loggedIn:self.username.text];
   }
}


@end
