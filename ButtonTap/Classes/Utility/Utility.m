//
//  Utility.m
//  ButtonTap
//
//  Created by Shamshad Khan on 12/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (void)showAlertWithMessage:(NSString*)message overVC:(UIViewController*)vc {
	
	UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"TapMe" message:message preferredStyle:UIAlertControllerStyleAlert];
	
	UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
	
	[alertVC addAction:okAction];
	
	[vc presentViewController:alertVC animated:YES completion:nil];
}

@end
