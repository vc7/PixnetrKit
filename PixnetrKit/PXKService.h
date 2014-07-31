//
//  PXKService.h
//  PixnetrKit
//
//  Created by vincent on 2014/07/30.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PXKService : NSObject

+ (id)sharedService;

+ (void)setParseApplicationId:(NSString *)applicationId clientKey:(NSString *)clientKey;
+ (void)setPixnetConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret callbackURL:(NSString *)callbackURL;

#pragma mark - Facebook Handlers
+ (BOOL)handleFBOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication;
+ (void)handleFBDidBecomeActive;

@end
