//
//  PXKURLGenerator.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "PXKURLGenerator.h"
#import "PXKAlbum.h"

static NSString *albumPreviewPrefix = @"http://s.pimg.tw/album2/%@/albumset/%d/zoomcrop/%.0fx%.0f.jpg";

@implementation PXKURLGenerator

+ (NSString *)generateAlbumPreviewImageURLStringWithAlbum:(PXKAlbum *)album size:(CGSize)size
{
    return [NSString stringWithFormat:albumPreviewPrefix, album.author, album.objectId, size.width, size.height];
}

@end
