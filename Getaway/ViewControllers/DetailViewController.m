//
//  DetailViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "IIViewDeckController.h"
#import "UIImage+StackBlur.h"


@implementation DetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    [self.scrollArea setDelegate:self];

    [self configureView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self setupScrollMask];
}

- (void)setupScrollMask {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.scrollArea.bounds;
    gradient.colors = @[
            (id) [UIColor colorWithWhite: 0 alpha: 0].CGColor,
            (id) [UIColor colorWithWhite: 0 alpha: 1].CGColor
    ];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 0.03f);
    [self.scrollArea.layer setMask: gradient];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.darkenedView setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];
    [self setupScrollMask];

    UIImage *buttonImage = [UIImage imageNamed:@"button.png"];
    UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bookButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    float toolbarWidth = self.navigationController.toolbar.bounds.size.width;
    float toolbarHeight = self.navigationController.toolbar.bounds.size.height;
    bookButton.frame = CGRectMake( 0, 0, toolbarWidth, toolbarHeight);
    [bookButton setTitle:@"Book Now" forState:UIControlStateNormal];
    [bookButton.titleLabel setFont: [UIFont boldSystemFontOfSize:18.0] ];
    [bookButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.bookButton setCustomView:bookButton];

    [self.backButton setAlpha: 0.8f];
    [self.titleLabel setAlpha: 0.8f];
    [self.priceLabel setAlpha: 0.8f];
    [self.description setAlpha: 0.8f];

    [self.viewDeckController setPanningMode: IIViewDeckNoPanning];

    [self.navigationController.toolbar setBarTintColor:[UIColor blackColor]];
    [self.navigationController.toolbar setOpaque:FALSE];
    [self.navigationController.toolbar setTranslucent:TRUE];

    [UIView animateWithDuration:0.15f animations:^(void) {
        [self.navigationController.navigationBar setAlpha: 0.0f];
    }];

    [UIView animateWithDuration:0.30f animations:^(void) {
        [self.navigationController setToolbarHidden: FALSE];
        [self.navigationController.toolbar setAlpha: 0.8f];

    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.viewDeckController setPanningMode: IIViewDeckFullViewPanning];

    [UIView animateWithDuration:0.15f animations:^(void) {
        [self.navigationController.navigationBar setAlpha: 1.0f];
    }];

    [UIView animateWithDuration:0.30f animations:^(void) {
        [self.navigationController setToolbarHidden: TRUE];
    }];
}

- (IBAction) customBack: (id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction) book: (id)sender
{
    [self performSegueWithIdentifier:@"checkBookingSegue" sender: sender];
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        UIImage *backgroundImage = [UIImage imageNamed: [self.detailItem objectForKey: @"image_large"]];
        UIImage *foregroundImage = [UIImage imageNamed: [self.detailItem objectForKey: @"image_small"]];
        UIImage *blurredBackgroundImage = [backgroundImage stackBlur: 20.0];

        [self.backgroundImage initWithImage: blurredBackgroundImage];
        [self.foregroundImage initWithImage: foregroundImage];

        [self.titleLabel setText: [self.detailItem objectForKey: @"name"]];
        [self.priceLabel setText: [self.detailItem objectForKey: @"price"]];
        NSString *description = [self.detailItem objectForKey: @"description"];
        [self.description setText: description];

        float width = self.description.bounds.size.width;
        CGSize descriptionSize = [description sizeWithFont: [UIFont systemFontOfSize: 14.0] constrainedToSize:CGSizeMake(width, 2500) lineBreakMode: UILineBreakModeWordWrap];
        // @todo: In order to make this work I needed to switch off auto-layout. That's bad.
        CGRect descriptionFrame = self.description.frame;
        descriptionFrame.size.height = descriptionSize.height + 300;
        [self.description setFrame: descriptionFrame];

        float height = 250 + descriptionSize.height + self.titleLabel.bounds.size.height + self.foregroundImage.bounds.size.height;
        [self.scrollArea setContentSize: CGSizeMake(1, height)];
    }


}

@end
