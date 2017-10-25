//
//  TapMeManager.h
//  ButtonTap
//
//  Created by Shamshad Khan on 23/01/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TapMePlayDelegate <NSObject>

-(void)updateTime:(int)newTime;
-(void)updateScore:(int)newScore;
-(void)gameOver:(int)finalScore;

@end

@interface TapMeManager : NSObject

{
    int _count;
    int _timeLapse;
    NSTimer *_timer;
    BOOL _isPlay;
}
@property (nonatomic, assign) int score;
@property (nonatomic, strong) id <TapMePlayDelegate> delegate;

- (void)updateScoreBy:(int)addScore;
- (void)setUpGameWithScore:(int)initialScore TotalTimeToPlay:(int)tTime TimeLapse:(int)timeLapse;
- (void)pauseGame:(BOOL)shouldPause;
- (void)stopGame;
@end
