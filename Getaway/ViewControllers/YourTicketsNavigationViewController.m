//
// Created by Seb Insua on 23/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "YourTicketsNavigationViewController.h"


@implementation YourTicketsNavigationViewController {

}

- (void)viewDidLoad {
    [self configureView];
}

- (void)configureView
{
    UIColor *lightBlue = [UIColor colorWithRed:40/256.0f
                                         green:183/256.0f
                                          blue:234/256.0f
                                         alpha:1.0];
    UIColor *darkBlue = [UIColor colorWithRed:33/255.0f
                                        green:148/255.0f
                                         blue:210/255.0f
                                        alpha:1.0];
    UIColor *white = [UIColor whiteColor];

    [self.view setBackgroundColor: lightBlue];
    [self.navigationController.navigationBar setBarTintColor: lightBlue];
    [self.navigationController.navigationBar setTintColor: darkBlue];
    [self.navigationController.navigationBar setTitleTextAttributes: @{
            NSForegroundColorAttributeName: white
    }];
}

@end