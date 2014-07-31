//
//  PXKURLGenerator.h
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PXKAlbum;

@interface PXKURLGenerator : NSObject

+ (NSString *)generateAlbumPreviewImageURLStringWithAlbum:(PXKAlbum *)album size:(CGSize)size;

@end
