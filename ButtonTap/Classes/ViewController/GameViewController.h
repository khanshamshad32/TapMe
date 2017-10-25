//
//  ViewController.h
//  ButtonTap
//
//  Created by Shamshad Khan on 12/01/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeScreenViewController.h"
#import "TapMeManager.h"

@interface GameViewController : UIViewController<UIAlertViewDelegate,TapMePlayDelegate>

{   
    TapMeManager *_tapMePlay;
    
    IBOutlet UIButton *_tapButton;
    IBOutlet UILabel  *_timerLabel;
    IBOutlet UILabel  *_scoreLabel;
    IBOutlet UIButton *_stopButton;
    IBOutlet UIButton *_optionPlayPauseButton;
}

-(IBAction)buttonPressed;
-(IBAction)onPlayPauseOptionPressed;
-(IBAction)stopPressed:(id)sender;

@end

