//
// Created by Seb Insua on 01/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BrowseNavigationViewController.h"


@implementation BrowseNavigationViewController {

}

- (void)viewDidLoad
{
    [self configureView];
}

- (void)configureView
{
    [self setNeedsStatusBarAppearanceUpdate];

    UIColor *lightBlue = [UIColor colorWithRed:40/256.0f
                                         green:183/256.0f
                                          blue:234/256.0f
                                         alpha:1.0];
    UIColor *darkBlue = [UIColor colorWithRed:33/255.0f
                                        green:148/255.0f
                                         blue:210/255.0f
                                        alpha:1.0];
    UIColor *white = [UIColor whiteColor];

    [self.view setBackgroundColor: lightBlue]; // When the navigationBar fades, it might look better...
    [self.navigationBar setBarTintColor: lightBlue];
    [self.navigationBar setTintColor: darkBlue];
    [self.navigationBar setTitleTextAttributes: @{
            NSForegroundColorAttributeName: white
    }];

    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end