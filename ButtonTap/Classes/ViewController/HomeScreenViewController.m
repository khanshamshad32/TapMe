//
//  HomeScreenViewController.m
//  ButtonTap
//
//  Created by Shamshad Khan on 17/01/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "HomeScreenViewController.h"
#import "DataManager.h"
#import <FirebaseAuth/FirebaseAuth.h>
#import "Define.h"

@interface HomeScreenViewController ()

@end

@implementation HomeScreenViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	[self checkForHighAScore];
}

#pragma mark - IBAction
- (IBAction)logoutClicked:(UIButton *)sender {
	
	if ([[FIRAuth auth] currentUser] != nil ){
		
		NSError* error = nil;
		[[FIRAuth auth] signOut:&error];
		
		if (error != nil){
			NSLog(@"Logout Error : %@", error.localizedDescription);
			return;
		}
		
		[[DataManager loadInstance] logoutUser];
		[self performSegueWithIdentifier:@"HomeToLoginScreen" sender:nil];
	}
}

- (void)checkForHighAScore {
	
	[[DataManager loadInstance] getHighScore:^(NSInteger highScore) {
		
		NSString* text = (highScore == INVALID_INT) ? @"---" : [NSString stringWithFormat:@"%ld",highScore];
		_highScoreLabel.text = [NSString stringWithFormat:@"%@ %@",kHighScoreText,text];
	}];
}

@end
