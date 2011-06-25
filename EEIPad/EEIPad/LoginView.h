//
//  LoginView.h
//  EEIPad
//
//  Created by Piotr Mionskowski on 6/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LoginView : UIViewController {
    
    UIImageView *backgroundImage;
    UITextField *username;
    UITextField *password;
}
@property (nonatomic, retain) IBOutlet UIImageView *backgroundImage;
@property (nonatomic, retain) IBOutlet UITextField *username;

@property (nonatomic, retain) IBOutlet UITextField *password;
@end
