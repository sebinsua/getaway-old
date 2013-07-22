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

    [self configureView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"Unpredicatable.");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self.darkenedView setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];

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
        UIImage *image = [UIImage imageNamed: [self.detailItem objectForKey: @"image_large"]];
        UIImage *blurredImage = [image stackBlur: 20.0];

        [self.backgroundImage initWithImage: blurredImage];
        [self.foregroundImage initWithImage: image];

        [self.titleLabel setText: [self.detailItem objectForKey: @"name"]];
        [self.priceLabel setText: [self.detailItem objectForKey: @"price"]];
        NSString *description = [self.detailItem objectForKey: @"description"];
        [self.description setText: description];

        float width = self.description.bounds.size.width;
        CGSize descriptionSize = [description sizeWithFont: [UIFont systemFontOfSize: 14.0] constrainedToSize:CGSizeMake(width, 1000) lineBreakMode: UILineBreakModeTailTruncation];
        // @todo: In order to make this work I needed to switch off auto-layout. That's bad.
        float height = 100 + descriptionSize.height + self.titleLabel.bounds.size.height + self.foregroundImage.bounds.size.height;
        CGRect descriptionFrame = self.description.frame;
        descriptionFrame.size.height = descriptionSize.height;
        [self.description setFrame: descriptionFrame];
        [self.scrollArea setContentSize: CGSizeMake(1, height)];
    }


}

@end
