//
//  ViewController.m
//  ButtonTap
//
//  Created by Shamshad Khan on 12/01/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "GameViewController.h"
#import "HomeScreenViewController.h"
#import "DataManager.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor  colorWithPatternImage:[UIImage  imageNamed:@"big_title.png"]];
    _scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    _timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage  imageNamed:@"field_timer.png"]];
    
    _tapMePlay=[[TapMeManager  alloc]init];
    [_tapMePlay setDelegate:self];
    [_tapMePlay setUpGameWithScore:0 TotalTimeToPlay:10 TimeLapse:1];
}

-(IBAction)buttonPressed{
    [_tapMePlay updateScoreBy:1];
}

-(IBAction)onPlayPauseOptionPressed{

	_optionPlayPauseButton.selected = !_optionPlayPauseButton.selected;
	_tapButton.enabled = ! _tapButton.enabled;
	[_tapMePlay pauseGame:_optionPlayPauseButton.isSelected];
}

-(IBAction)stopPressed:(id)sender{
	
	[_tapMePlay stopGame];
}

#pragma mark: - TapMePlayDelegate

-(void)updateTime:(int)newTime{
    _timerLabel.text= [NSString stringWithFormat:@"Time  %i",newTime];
}

-(void)updateScore:(int)newScore{
    _scoreLabel.text = [NSString stringWithFormat:@"Score  %i",newScore];
}

-(void)gameOver:(int)finalScore{
    
    NSString *s=[NSString stringWithFormat:@"Your score %i",finalScore];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Game Over" message:s preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
	
	NSString* currentDate = [NSString stringWithFormat:@"%@", [NSDate date] ];
	[[DataManager loadInstance] addScore:finalScore time:currentDate];
}

@end
