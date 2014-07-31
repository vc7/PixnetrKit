//
//  PXKAlbum.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <PIXNETSDK.h>

#import "PXKAlbum.h"
#import "PXKURLGenerator.h"

@implementation PXKAlbum

+ (void)fetchHotAlbumsWithCategoryIDs:(NSArray *)categoryIds page:(NSUInteger)page perPage:(NSUInteger)perPage resultBlock:(PXKArrayResultBlock)block
{
    [[PIXNETSDK sharedInstance] getMainpageAlbumsWithCategoryIDs:@[@"25"] albumType:PIXMainpageTypeHot page:page perPage:perPage strictFilter:1 completion:^(BOOL succeed, id result, NSError *error) {
        
        if (succeed) {
            __block NSMutableArray *albumArray = [NSMutableArray array];
            
            [[result objectForKey:@"sets"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                [albumArray addObject:[[PXKAlbum alloc] initWithDictionary:obj]];
            }];
            
            block(albumArray, nil);
            
        } else {
            block(nil, error);
        }
    }];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.objectId = [[dictionary objectForKey:@"id"] integerValue];
        self.title = [dictionary objectForKey:@"title"];
        self.categoryId = [[dictionary objectForKey:@"category_id"] integerValue];
        self.categoryName = [dictionary objectForKey:@"category"];
    }
    return self;
}

#pragma mark - Accessor

- (NSString *)previewImageURLString
{
    return [PXKURLGenerator generateAlbumPreviewImageURLStringWithAlbum:self size:(CGSize){ 20, 50 }];
}

@end
