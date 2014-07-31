//
//  PXKUser.h
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXKConstants.h"

@interface PXKUser : PFUser <PFSubclassing>

+ (void)logInWithResultBlock:(PXKUserResultBlock)block;

@end
