//
//  TapMeManager.m
//  ButtonTap
//
//  Created by Shamshad Khan on 23/01/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "TapMeManager.h"

@implementation TapMeManager

- (void)refresh{
    
    if(_timeLapse>0){
        _count=_count - _timeLapse;
        [_delegate  updateTime:_count];
    
        if(_count <= 0 )
			[self stopGame];
    }
}

- (void)setUpGameWithScore:(int)initialScore TotalTimeToPlay:(int)tTime TimeLapse:(int)timeLapse{
    
    _score=initialScore;
    _count=tTime;
    _isPlay=true;
    _timeLapse=timeLapse;
    
    [_delegate updateTime:_count];
    [_delegate updateScore:_score];
    
     _timer = [NSTimer scheduledTimerWithTimeInterval:_timeLapse
                                              target:self
                                             selector:@selector(refresh)
                                            userInfo:nil
                                             repeats:YES];
}

- (void)updateScoreBy:(int)addScore{
    _score++;
    [_delegate  updateScore:_score];
}

- (void)pauseGame:(BOOL)shouldPause{
    
    if(shouldPause){    // Games comes to pause
        [_timer  invalidate];
    }
    else{      // Game starts again
        _timer = [NSTimer scheduledTimerWithTimeInterval:_timeLapse
                                                  target:self
                                                selector:@selector(refresh)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)stopGame {
	
	[_timer  invalidate];
	[_delegate  gameOver:_score];
	_isPlay = NO;
}
@end
