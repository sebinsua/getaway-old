//
//  DetailViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

- (void) viewDidLoad
{
    [super viewDidLoad];

    // [self.viewDeckController setPanningMode: IIViewDeckNoPanning];
    [self configureView];

    [self layoutForDetailItem];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self configureScrollMask];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture
{
    CGRect frame = self.blurredView.frame;
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight && frame.origin.x == -320) {
        frame.origin.x += self.view.bounds.size.width;
        // NSLog(@"%f", frame.origin.x);
    }
    else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft && frame.origin.x == 0) {
        frame.origin.x -= self.view.bounds.size.width;
        // NSLog(@"%f", frame.origin.x);
    }

    // Now animate the changing of the frame
    [UIView animateWithDuration:0.4 animations: ^{
        self.blurredView.frame = frame;
    }];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

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
    // [self.viewDeckController setPanningMode: IIViewDeckFullViewPanning];

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

- (IBAction) book:(id)sender
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

    [self.navigationController.toolbar setBarTintColor: [UIColor blackColor]];
    [self.navigationController.toolbar setOpaque:FALSE];
    [self.navigationController.toolbar setTranslucent:TRUE];

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
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
