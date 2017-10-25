//
//  SignUpViewController.h
//  ButtonTap
//
//  Created by Shamshad Khan on 10/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


@end
