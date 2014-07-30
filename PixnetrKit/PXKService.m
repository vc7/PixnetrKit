//
//  PXKService.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/30.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "PXKService.h"

@implementation PXKService

+ (void)setParseApplicationId:(NSString *)applicationId clientKey:(NSString *)clientKey
{
    [Parse setApplicationId:applicationId clientKey:clientKey];
}

+ (void)setPixnetConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret callbackURL:(NSString *)callbackURL
{
    [PIXNETSDK setConsumerKey:consumerKey consumerSecret:consumerSecret callbackURL:callbackURL];
}

@end
