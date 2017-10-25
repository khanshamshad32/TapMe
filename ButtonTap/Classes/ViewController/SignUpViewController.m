//
//  SignUpViewController.m
//  ButtonTap
//
//  Created by Shamshad Khan on 10/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "SignUpViewController.h"
#import <FirebaseAuth/FirebaseAuth.h>
#import "Utility.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];	
}

#pragma mark - IBAction

- (IBAction)signUpClicked:(UIButton *)sender {
	
	__weak typeof(self) weakSelf = self;
	
	if ([self isValidFeilds]) {
		
		[[FIRAuth auth] createUserWithEmail:_emailTF.text password:_passwordTF.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
			
			if (error == nil) {
				
				NSLog(@"Sign successful");
				[self.navigationController popViewControllerAnimated:YES];
				
			}
			else
				[Utility showAlertWithMessage:error.localizedDescription overVC:weakSelf];
		}];
		
	} else
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
