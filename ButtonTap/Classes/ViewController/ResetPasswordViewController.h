//
//  ResetPasswordViewController.h
//  ButtonTap
//
//  Created by Shamshad Khan on 12/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResetPasswordViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTF;

@end
