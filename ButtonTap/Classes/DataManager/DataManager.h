//
//  DataManager.h
//  ButtonTap
//
//  Created by Shamshad Khan on 11/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (DataManager*)loadInstance;

- (void)saveUserForEmail:(NSString*)email password:(NSString*)pass;
- (BOOL)isUseredLogin;
- (void)logoutUser;

- (void)addScore:(NSInteger)score time:(NSString*)time;

- (void)getHighScore:(void (^)(NSInteger))completion;

@end
