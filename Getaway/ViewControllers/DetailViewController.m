//
//  DetailViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "IIViewDeckController.h"
#import "BrowseNavigationViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewDeckController setPanningMode: IIViewDeckNoPanning];
    // [self.navigationController.view setAlpha: 0.6];

    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setTranslucent:TRUE];

    [self.navigationController.toolbar setBarTintColor:[UIColor clearColor]];
    [self.navigationController.toolbar setTranslucent:TRUE];
    [self.navigationController setToolbarHidden: FALSE];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.viewDeckController setPanningMode: IIViewDeckFullViewPanning];

    UIColor *lightBlue = [UIColor colorWithRed:40/256.0f
                                         green:183/256.0f
                                          blue:234/256.0f
                                         alpha:1.0];

    [UIView animateWithDuration:0.5 animations:^(void) {
        // [self.navigationController.view setAlpha: 1.0];
        [self.navigationController.navigationBar setBarTintColor: lightBlue];
        [self.navigationController.navigationBar setTranslucent:FALSE];
        [self.navigationController setToolbarHidden: TRUE];

    }];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.titleLabel.text = [self.detailItem objectForKey: @"name"];
        [self.backgroundImage initWithImage: [UIImage imageNamed: [self.detailItem objectForKey: @"image_large"]]];
        self.descriptionLabel.text = [self.detailItem objectForKey: @"name"];
    }
}

@end
