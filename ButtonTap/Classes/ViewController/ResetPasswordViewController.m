//
//  ResetPasswordViewController.m
//  ButtonTap
//
//  Created by Shamshad Khan on 12/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "Utility.h"
#import <FirebaseAuth/FirebaseAuth.h>


@interface ResetPasswordViewController ()

@end

@implementation ResetPasswordViewController

#pragma mark - IBAction

- (IBAction)submitClicked:(UIButton *)sender {
	
	if ([_emailTF.text  isEqual: @""]) {
		
		[Utility showAlertWithMessage:kInvalidFields overVC:self];
	}
	else {
		
		__weak typeof(self) weakSelf = self;
		[[FIRAuth auth] sendPasswordResetWithEmail:_emailTF.text completion:^(NSError * _Nullable error) {
			
			NSString* message = error.localizedDescription;
			
			if (message == nil)
				message = kResetLinkSent;
			
			[Utility showAlertWithMessage:message overVC:weakSelf];
		}];
	}
}

#pragma mark - TextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	
	[textField resignFirstResponder];
	return YES;
}

@end
