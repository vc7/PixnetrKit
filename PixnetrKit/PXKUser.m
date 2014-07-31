//
//  PXKUser.m
//  PixnetrKit
//
//  Created by vincent on 2014/07/31.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import <Parse.h>
#import <PFObject+Subclass.h>
#import <PIXNETSDK.h>

#import "PXKUser.h"

@implementation PXKUser

+ (void)logInWithResultBlock:(PXKUserResultBlock)block
{
    [PFFacebookUtils logInWithPermissions:@[@"publish_actions"] block:^(PFUser *user, NSError *error) {
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            //[self.navigationController pushViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
        } else {
            NSLog(@"User with facebook logged in!");
            //[self.navigationController pushViewController:[[UserDetailsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
        }
        
        block(user, error);
    }];
}

@end
