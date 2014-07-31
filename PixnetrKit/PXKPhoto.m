//
//  PXKPhoto.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <PFObject+Subclass.h>
#import <PIXNETSDK.h>

#import "PXKPhoto.h"
#import "PXKAlbum.h"

@implementation PXKPhoto

@dynamic title;
@dynamic pixnetId;
@dynamic pixnetIdentifier;
@dynamic photoRatio;
@dynamic likedCount;

+ (NSString *)parseClassName
{
    return @"Photo";
}

+ (void)fetchPhotosWithAlbum:(PXKAlbum *)album page:(NSUInteger)page perPage:(NSUInteger)perPage resultBlock:(PXKArrayResultBlock)block;
{
    @synchronized(self) {
        [[PIXAlbum new] getAlbumSetElementsWithUserName:album.author setID:[NSString stringWithFormat:@"%d",album.objectId] elementType:PIXAlbumElementTypePic page:page perPage:perPage password:nil withDetail:YES trimUser:YES shouldAuth:NO completion:^(BOOL succeed, id result, NSError *error) {
            
            if (succeed) {
                __block NSMutableArray *photosArray = [NSMutableArray array];
                
                NSArray *photoElements = [result objectForKey:@"elements"];
                
                [photoElements enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    
                    PXKPhoto *photo = [[PXKPhoto alloc] initWithDictionary:obj];
                    photo.author = album.author;
                    
                    [photosArray addObject:photo];
                }];
                
                block(photosArray, nil);
                
            } else {
                block(nil, error);
            }
            
        }];
    }
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.pixnetId = [dictionary objectForKey:@"id"];
        self.pixnetIdentifier = [dictionary objectForKey:@"identifier"];
        self.photoRatio = [self _calculatePhotoRatioWithDimension:[dictionary objectForKey:@"dimension"]];
    }
    return self;
}

- (NSNumber *)_calculatePhotoRatioWithDimension:(NSDictionary *)dimensionDictionary
{
    CGFloat photoWidth = [[[dimensionDictionary objectForKey:@"original"] objectForKey:@"width"] floatValue];
    CGFloat photoHeight = [[[dimensionDictionary objectForKey:@"original"] objectForKey:@"height"] floatValue];
    
    return @(photoWidth/photoHeight);
}

@end
