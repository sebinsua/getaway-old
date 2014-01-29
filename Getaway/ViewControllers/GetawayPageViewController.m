//
// Created by Seb Insua on 03/11/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//


#import "GetawayPageViewController.h"
#import "DetailViewController.h"

#import "UIViewController+MMDrawerController.h"

@implementation GetawayPageViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    DetailViewController *initialViewController = [self.storyboard instantiateViewControllerWithIdentifier: @"detailViewController"];
    self.pages = @[initialViewController];
    // [self setHidesBottomBarWhenPushed: FALSE];
    // [self setDoubleSided: YES];

    [self setViewControllers: self.pages direction: UIPageViewControllerNavigationDirectionForward animated: YES completion: nil];

    self.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.mm_drawerController setOpenDrawerGestureModeMask: MMOpenDrawerGestureModeNone];

    [UIView animateWithDuration:0.10f animations:^(void) {
        [self.navigationController.navigationBar setTranslucent: TRUE];
        [self.navigationController.navigationBar setBackgroundImage: [[UIImage alloc] init] forBarMetrics: UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage: [[UIImage alloc] init]];
        [self.navigationController.navigationBar setBackgroundColor: [UIColor clearColor]];
        [self.navigationController.navigationBar setBarTintColor: [UIColor clearColor]];
        [self.navigationController.navigationBar setTintColor: [[UIColor alloc] initWithWhite:1.0f alpha:0.8f]];

    }];

    [UIView animateWithDuration:0.50f animations:^(void) {
        [self.navigationController setToolbarHidden: FALSE];
        [self.navigationController.toolbar setAlpha: 0.8f];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mm_drawerController setOpenDrawerGestureModeMask: MMOpenDrawerGestureModeBezelPanningCenterView];

    UIColor *lightBlue = [UIColor colorWithRed:40/256.0f
                                         green:183/256.0f
                                          blue:234/256.0f
                                         alpha:1.0];
    UIColor *darkBlue = [UIColor colorWithRed:33/255.0f
                                        green:148/255.0f
                                         blue:210/255.0f
                                        alpha:1.0];
    UIColor *white = [UIColor whiteColor];

    [UIView animateWithDuration:0.10f animations:^(void) {
        [self.navigationController.toolbar setAlpha: 0.0f];
        [self.navigationController setToolbarHidden: TRUE];

        [self.navigationController.navigationBar setTranslucent: FALSE];
        [self.navigationController.view setBackgroundColor: lightBlue];
        [self.navigationController.navigationBar setBackgroundImage: nil forBarMetrics: UIBarMetricsDefault];
        [self.navigationController.navigationBar setBarTintColor: lightBlue];
        [self.navigationController.navigationBar setBackgroundColor: lightBlue];
        [self.navigationController.navigationBar setTintColor: darkBlue];
        [self.navigationController.navigationBar setTitleTextAttributes: @{
                NSForegroundColorAttributeName: white
        }];
    }];
}


-(void)setDetailItem:(id)detailItem {

}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (nil == viewController) {
        return _pages[0];
    }
    NSInteger idx = [_pages indexOfObject:viewController];
    NSParameterAssert(idx != NSNotFound);
    if (idx >= [_pages count] - 1) {
        // we're at the end of the _pages array
        return nil;
    }
    // return the next page's view controller
    return _pages[idx + 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (nil == viewController) {
        return _pages[0];
    }
    NSInteger idx = [_pages indexOfObject:viewController];
    NSParameterAssert(idx != NSNotFound);
    if (idx <= 0) {
        // we're at the end of the _pages array
        return nil;
    }
    // return the previous page's view controller
    return _pages[idx - 1];
}


@end