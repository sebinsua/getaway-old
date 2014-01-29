//
//  DetailViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import "DetailViewController.h"
#import "GetawayPageViewController.h"

@implementation DetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    [self configureView];

    [self layoutForDetailItem];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self configureScrollMask];
}

- (void)configureScrollMask
{
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

- (IBAction) book:(id)sender
{
    [self performSegueWithIdentifier:@"checkBookingSegue" sender: sender];
}

#pragma mark - Managing the detail item

- (void)configureView
{
    [self.scrollArea setDelegate:self];

    CALayer *darkenLayer = [CALayer layer];
    darkenLayer.frame = self.backgroundImage.frame;
    darkenLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4f].CGColor;
    [self.backgroundImage.layer addSublayer: darkenLayer];

    float toolbarWidth = self.navigationController.toolbar.bounds.size.width;
    float toolbarHeight = self.navigationController.toolbar.bounds.size.height;
    self.bookButton.customView.frame = CGRectMake( 0, 0, toolbarWidth, toolbarHeight);

    [self.titleLabel setAlpha: 0.8f];
    [self.priceLabel setAlpha: 0.8f];
    [self.description setAlpha: 0.8f];

    [self.blurredView setUserInteractionEnabled: YES];
    [self.blurredView setBlurRadius: 30.0f];
    [self.blurredView setTintColor: [UIColor clearColor]];

    /*
    [self.navigationController.toolbar setBarTintColor: [UIColor blackColor]];
    [self.navigationController.toolbar setOpaque:FALSE];
    [self.navigationController.toolbar setTranslucent:TRUE];
    */

}

- (void)layoutForDetailItem
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        UIImage *backgroundImage = [UIImage imageNamed: [self.detailItem objectForKey: @"image_large"]];
        [self.backgroundImage initWithImage: backgroundImage];

        [self.titleLabel setText: [self.detailItem objectForKey: @"name"]];
        [self.priceLabel setText: [self.detailItem objectForKey: @"price"]];

        NSString *description = [self.detailItem objectForKey: @"description"];
        [self.description setText: description];

        // Correcting the size of the description box... :)
        float width = self.description.bounds.size.width;
        CGSize descriptionSize = [description sizeWithFont: [UIFont systemFontOfSize: 16.0] constrainedToSize:CGSizeMake(width, 2500) lineBreakMode: UILineBreakModeWordWrap];
        // @todo: In order to make this work I needed to switch off auto-layout. That's bad.
        CGRect descriptionFrame = self.description.frame;
        descriptionFrame.size.height = descriptionSize.height + 500;
        [self.description setFrame: descriptionFrame];

        float height = 200 + descriptionSize.height + self.titleLabel.bounds.size.height;
        [self.scrollArea setContentSize: CGSizeMake(1, height)];
    }
}

@end
