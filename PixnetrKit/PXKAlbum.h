//
//  PXKAlbum.h
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXKConstants.h"

@interface PXKAlbum : NSObject

+ (void)fetchHotAlbumsWithCategoryIDs:(NSArray *)categoryIds page:(NSUInteger)page perPage:(NSUInteger)perPage resultBlock:(PXKArrayResultBlock)block;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic) NSInteger objectId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (nonatomic) NSInteger categoryId;
@property (strong, nonatomic) NSString *categoryName;
@property (nonatomic) NSUInteger photosCount;

- (NSString *)previewImageURLString;

@end
