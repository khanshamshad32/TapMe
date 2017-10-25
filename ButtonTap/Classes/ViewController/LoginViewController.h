//
//  LoginViewController.h
//  ButtonTap
//
//  Created by Shamshad Khan on 10/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@end
