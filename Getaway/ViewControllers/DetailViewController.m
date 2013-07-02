//
//  DetailViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "IIViewDeckController.h"
#import "UIImage+StackBlur.h"

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

    // [self.navigationController.navigationBar setBarStyle: UIBarStyleDefault];
    // [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    // [self.navigationController.navigationBar setOpaque:FALSE];
    // [self.navigationController.navigationBar setTranslucent:TRUE];
    [UIView animateWithDuration:0.5 animations:^(void) {
        [self.navigationController.navigationBar setAlpha: 0.0];

        [self.navigationController setToolbarHidden: FALSE];
        [self.navigationController.toolbar setBarTintColor:[UIColor blackColor]];
        [self.navigationController.toolbar setOpaque:FALSE];
        [self.navigationController.toolbar setTranslucent:TRUE];
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController.navigationBar setHidden: TRUE];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.viewDeckController setPanningMode: IIViewDeckFullViewPanning];

    // [self.navigationController.navigationBar setBarTintColor: lightBlue];
    // [self.navigationController.navigationBar setOpaque:TRUE];
    // [self.navigationController.navigationBar setTranslucent:FALSE];
    [UIView animateWithDuration:0.5 animations:^(void) {
        [self.navigationController.navigationBar setAlpha: 1.0];
        [self.navigationController.navigationBar setHidden: FALSE];

        [self.navigationController setToolbarHidden: TRUE];
    }];
}

- (IBAction) customBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
        UIImage *image = [UIImage imageNamed: [self.detailItem objectForKey: @"image_large"]];
        UIImage *blurredImage = [image stackBlur: 15.0];

        [self.titleLabel setText: [self.detailItem objectForKey: @"name"]];
        [self.backgroundImage initWithImage: blurredImage];
        [self.priceLabel setText: [self.detailItem objectForKey: @"price"]];
        [self.descriptionLabel setText:[self.detailItem objectForKey: @"description"]];
    }
}

@end
