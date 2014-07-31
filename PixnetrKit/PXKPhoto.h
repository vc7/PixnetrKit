//
//  PXKPhoto.h
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Parse.h>
#import "PXKConstants.h"

@class PXKAlbum;

@interface PXKPhoto : PFObject <PFSubclassing>

+ (NSString *)parseClassName;

+ (void)fetchPhotosWithAlbum:(PXKAlbum *)album page:(NSUInteger)page perPage:(NSUInteger)perPage resultBlock:(PXKArrayResultBlock)block;

@property (strong) NSString *title;
@property (strong) NSString *pixnetId;
@property (strong) NSString *pixnetIdentifier;
@property (strong) NSNumber *photoRatio;
@property (strong) NSNumber *likedCount;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
