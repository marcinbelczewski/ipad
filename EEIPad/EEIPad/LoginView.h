//
//  LoginView.h
//  EEIPad
//
//  Created by Piotr Mionskowski on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebRequest.h"

@protocol LoginDelegate
-(void)loggedIn:(NSString *)userName;
@end


@interface LoginView : UIViewController<UITextFieldDelegate, WebRequestDelegate> {
    
    UIImageView *backgroundImage;
    UILabel *errorText;
    UITextField *username;
    UITextField *password;
    UIButton *signInButton;

    WebRequest *_loginRequest;
@private
    id <LoginDelegate> _delegate;
}
@property (nonatomic, retain) IBOutlet UIButton *signInButton;
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, retain) IBOutlet UILabel *errorText;
@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, assign) id<LoginDelegate> delegate;
- (IBAction)tryLogin;

- (IBAction)credentialChanged:(id)sender;

@property (nonatomic, retain) IBOutlet UITextField *password;
@end
