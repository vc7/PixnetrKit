//
//  PXKService.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/30.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Parse.h>
#import <PIXNETSDK.h>

#import "PXKService.h"
#import "PXKUser.h"
#import "PXKPhoto.h"

@implementation PXKService

+ (id)sharedService
{
    static PXKService *sharedTheService = nil;
    @synchronized(self) {
        if (sharedTheService == nil) {
            sharedTheService = [[self alloc] init];
        }
    }
    return sharedTheService;
}

+ (void)setParseApplicationId:(NSString *)applicationId clientKey:(NSString *)clientKey
{
    [PXKUser registerSubclass];
    [PXKPhoto registerSubclass];
    
    [Parse setApplicationId:applicationId clientKey:clientKey];
    [PFFacebookUtils initializeFacebook];
}

+ (void)setPixnetConsumerKey:(NSString *)consumerKey consumerSecret:(NSString *)consumerSecret callbackURL:(NSString *)callbackURL
{
    [PIXNETSDK setConsumerKey:consumerKey consumerSecret:consumerSecret callbackURL:callbackURL];
}

#pragma mark - Facebook Handlers
+ (BOOL)handleFBOpenURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication
{
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:[PFFacebookUtils session]];
}

+ (void)handleFBDidBecomeActive
{
    [FBAppCall handleDidBecomeActiveWithSession:[PFFacebookUtils session]];
}


@end
