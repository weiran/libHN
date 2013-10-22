//
//  HNViewController.m
//  libHN-Demo
//
//  Created by Ben Gordon on 10/6/13.
//  Copyright (c) 2013 subvertapps. All rights reserved.
//

#import "HNViewController.h"
#import "libHN.h"

@interface HNViewController ()

@end

@implementation HNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Test Login
    [self loginTest];
    
    // Test Getting Posts
    //[self getPostsTest];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loginTest {
    // If no user is logged in, log in
    if (![[HNManager sharedManager] userIsLoggedIn]) {
        [[HNManager sharedManager] loginWithUsername:@"user" password:@"pass" completion:^(HNUser *user) {
            if (user) {
                NSLog(@"%@ - %d", user.Username, user.Karma);
            }
        }];
    }
}

- (void)getPostsTest {
    [[HNManager sharedManager] loadPostsWithFilter:PostFilterTypeTop completion:^(NSArray *posts) {
        if (posts) {
            // Test Getting Comments
            [self getCommentsTest:posts[0]];
        }
    }];
}

- (void)getCommentsTest:(HNPost *)post {
    [[HNManager sharedManager] loadCommentsFromPost:post completion:^(NSArray *comments) {
        if (comments) {
            
        }
    }];
}

@end
