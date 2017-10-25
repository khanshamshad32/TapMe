//
//  DataManager.m
//  ButtonTap
//
//  Created by Shamshad Khan on 11/10/17.
//  Copyright © 2017 Shamshad Khan. All rights reserved.
//

#import "DataManager.h"
#import "Define.h"
#import <Firestore/Firestore.h>

static DataManager* shared = nil;

@implementation DataManager

+ (DataManager*)loadInstance {
	
	if (shared == nil) {
		
		static dispatch_once_t onceToken;
		dispatch_once(&onceToken, ^{
			shared = [[DataManager alloc] init];
		});
	}
	
	return shared;
}

- (void)saveUserForEmail:(NSString*)email password:(NSString*)pass {
	
	[[NSUserDefaults standardUserDefaults] setValue:email forKey:kEmailIDKey];
	[[NSUserDefaults standardUserDefaults] setValue:pass forKey:kPasswordKey];
}

- (BOOL)isUseredLogin {
	
	NSString* email = [[NSUserDefaults standardUserDefaults] valueForKey:kEmailIDKey];
	NSString* password = [[NSUserDefaults standardUserDefaults] valueForKey:kPasswordKey];
	
	if (email != nil && password != nil)
		return YES;
	return NO;
}

- (void)logoutUser {
	
	[[NSUserDefaults standardUserDefaults] setValue:nil forKey:kEmailIDKey];
	[[NSUserDefaults standardUserDefaults] setValue:nil forKey:kPasswordKey];
}

#pragma mark - Score

- (void)addScore:(NSInteger)score time:(NSString*)time {
	
	NSString* email = [[NSUserDefaults standardUserDefaults] valueForKey:kEmailIDKey];
	FIRFirestore* db = FIRFirestore.firestore;
	
	__weak typeof(self) weakSelf = self;
	
	__block FIRDocumentReference* ref =
		[[db collectionWithPath:email] addDocumentWithData: @{
			kScoreKey : [NSNumber numberWithInteger: score],
			kTimeKey  : time
		}
		completion:^(NSError * _Nullable error) {
			
			if (error != nil) {
				NSLog(@"Error adding score %@", error);
			} else {
				NSLog(@"Score added with ref id : %@", ref.documentID);
				
				[weakSelf getHighScore:^(NSInteger highScore) {
					if (highScore < score)
						[weakSelf updateHighScoreTo:score time:time];
				}];
			}
		}];	
}

- (void)getHighScore:(void (^)(NSInteger))completion {
	
	NSString* email = [[NSUserDefaults standardUserDefaults] valueForKey:kEmailIDKey];
	FIRFirestore* db = FIRFirestore.firestore;
	
	FIRDocumentReference* ref = [ [db collectionWithPath:email] documentWithPath:kHighScoreDocument];
	
	[ref getDocumentWithCompletion:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error) {
		
		if (error != nil) {
			NSLog(@"Error getting high score");
		}
		else {
			if (snapshot.exists ) {
				id lastScore = snapshot.data[kScoreKey];
				if ([lastScore isKindOfClass:[NSNumber class]]) {
					int score = ((NSNumber*)lastScore).integerValue;
					completion(score);
					return;
				}
			}
		}
		completion(INVALID_INT);
	}];
}

- (void)updateHighScoreTo:(NSInteger)score time:(NSString*)time {
	
	NSString* email = [[NSUserDefaults standardUserDefaults] valueForKey:kEmailIDKey];
	FIRFirestore* db = FIRFirestore.firestore;
	
	[[[db collectionWithPath:email] documentWithPath:kHighScoreDocument]
	 setData:@{
	   kScoreKey : [NSNumber numberWithInteger: score],
	   kTimeKey  : time
	 }
	 options:[FIRSetOptions merge]
	 completion:^(NSError * _Nullable error) {
		 if (error != nil)
			 NSLog(@"Error adding score %@", error);
	 }];
}

@end
