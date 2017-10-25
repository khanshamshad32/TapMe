//
//  SpashViewController.m
//  ButtonTap
//
//  Created by Shamshad Khan on 11/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "DataManager.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (void) viewDidAppear:(BOOL)animated {
	
	[super viewDidAppear:animated];	
	
	if ( [[DataManager loadInstance] isUseredLogin])
		[self performSegueWithIdentifier:@"SplashToHomeScreen" sender:nil];
	else
		[self performSegueWithIdentifier:@"SplashToLoginScreen" sender:nil];
}

@end
