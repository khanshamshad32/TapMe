//
//  LoginViewController.m
//  ButtonTap
//
//  Created by Shamshad Khan on 10/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "LoginViewController.h"
#import "DataManager.h"
#import <FirebaseAuth/FirebaseAuth.h>
#import "Utility.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark: - IBAction

- (IBAction)logInClicked:(UIButton *)sender {
	
	__weak typeof(self) weakSelf = self;
	
	if ([self isValidFeilds]) {
		
		[[FIRAuth auth] signInWithEmail:_emailTF.text password:_passwordTF.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
			
			if (error == nil ) {
				NSLog(@"Login Successful");
				[[DataManager loadInstance] saveUserForEmail:weakSelf.emailTF.text password:weakSelf.passwordTF.text];
				[weakSelf performSegueWithIdentifier:@"LoginToHomeScreen" sender:nil];
			}
			else
				[Utility showAlertWithMessage:error.localizedDescription overVC:weakSelf];
		}];
	}
	else
		[Utility showAlertWithMessage:kInvalidFields overVC:self];
}

- (BOOL)isValidFeilds {
	
	if ( [_emailTF.text  isEqual: @""] || [_passwordTF.text  isEqual: @""])
		return NO;
	return YES;
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}

@end
