//
//  PXKURLGenerator.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "PXKURLGenerator.h"
#import "PXKAlbum.h"
#import "PXKPhoto.h"

static NSString *albumPreviewTemplateString = @"http://s.pimg.tw/album2/%@/albumset/%d/zoomcrop/%.0fx%.0f.jpg";
static NSString *avatarTemplateString = @"http://s.pimg.tw/avatar/%@/0/0/zoomcrop/%.0fx%.0f.jpg";

static NSString *photoTemplateString = @"http://s.pimg.tw/album/%@/element/%@_%@/zoomcrop/%.0fx%.0f.jpg";

@implementation PXKURLGenerator

+ (NSString *)generateAlbumPreviewImageURLStringWithAlbum:(PXKAlbum *)album size:(CGSize)size
{
    return [NSString stringWithFormat:albumPreviewTemplateString, album.author, album.objectId, size.width, size.height];
}

+ (NSString *)generateAvatarImageURLStringWithUsername:(NSString *)username size:(CGSize)size
{
    return [NSString stringWithFormat:avatarTemplateString, username, size.width, size.height];
}

+ (NSString *)generatePhotoImageURLStringWithPhoto:(PXKPhoto *)photo size:(CGSize)size;
{
    return [NSString stringWithFormat:photoTemplateString, photo.author, photo.pixnetId, photo.pixnetIdentifier,  size.width, size.height];
}

@end
