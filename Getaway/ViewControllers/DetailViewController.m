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

    // The background of the navigation controller is light blue so this works,
    // it's nasty that we're having to do this so fast but the problem is that the animation isn't a constant speed
    // and I do not know how to sync with it. Key frames?
    [UIView animateWithDuration:0.15f animations:^(void) {
        CGFloat old_x = self.navigationController.navigationBar.layer.position.x;
        CGFloat old_y = self.navigationController.navigationBar.layer.position.y;
        NSLog(@"scrolling in - old_x: %f, old_y: %f", old_x, old_y);
        [self.navigationController.navigationBar.layer setPosition:CGPointMake(-old_x, old_y)];
    }];

    [UIView animateWithDuration:0.30f animations:^(void) {
        // [self.navigationController.navigationBar setAlpha: 0.0];
        [self.navigationController setToolbarHidden: FALSE];
        [self.navigationController.toolbar setBarTintColor:[UIColor blackColor]];
        [self.navigationController.toolbar setOpaque:FALSE];
        [self.navigationController.toolbar setTranslucent:TRUE];
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // [self.navigationController.navigationBar setHidden: TRUE];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.viewDeckController setPanningMode: IIViewDeckFullViewPanning];

    [UIView animateWithDuration:0.15f animations:^(void) {
        CGFloat old_x = self.navigationController.navigationBar.layer.position.x;
        CGFloat old_y = self.navigationController.navigationBar.layer.position.y;
        NSLog(@"scrolling out - old_x: %f, old_y: %f", old_x, old_y);
        [self.navigationController.navigationBar.layer setPosition:CGPointMake(-old_x, old_y)];
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
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    [self.darkenedView setBackgroundColor:[UIColor colorWithWhite:0.0f alpha:0.3f]];

    [self.backButton setAlpha: 0.8f];
    [self.titleLabel setAlpha: 0.8f];
    [self.priceLabel setAlpha: 0.8f];
    [self.description setAlpha: 0.8f];

    // Update the user interface for the detail item.

    if (self.detailItem) {
        UIImage *image = [UIImage imageNamed: [self.detailItem objectForKey: @"image_large"]];
        UIImage *blurredImage = [image stackBlur: 20.0];

        /*
        NSMutableDictionary *options = [[NSMutableDictionary alloc] init];
        [options setObject: [NSNull null] forKey: kCIContextWorkingColorSpace];
        CIContext *context = [CIContext contextWithOptions:options];
        CIImage *inputImage = [[CIImage alloc] initWithImage: blurredImage]; //your input image

        CIFilter* blackGenerator = [CIFilter filterWithName:@"CIConstantColorGenerator"];
        CIColor* black = [CIColor colorWithString:@"0.0 0.0 0.0 0.6"];
        [blackGenerator setValue:black forKey:@"inputColor"];
        CIImage* blackImage = [blackGenerator valueForKey:@"outputImage"];

        CIFilter *compositeFilter = [CIFilter filterWithName:@"CIMultiplyBlendMode"];
        [compositeFilter setValue:blackImage forKey:@"inputImage"];
        [compositeFilter setValue:inputImage forKey:@"inputBackgroundImage"];
        CIImage *darkenedImage = [compositeFilter outputImage];

        CGImageRef cgimg = [context createCGImage:darkenedImage fromRect:inputImage.extent];
        UIImage *outputImage = [UIImage imageWithCGImage: cgimg];
        CGImageRelease(cgimg);
        */
        [self.backgroundImage initWithImage: blurredImage];
        [self.foregroundImage initWithImage: image];

        [self.titleLabel setText: [self.detailItem objectForKey: @"name"]];
        [self.priceLabel setText: [self.detailItem objectForKey: @"price"]];
        [self.description setText:[self.detailItem objectForKey: @"description"]];

        [self.foregroundImage setOpaque:true];
    }
}

@end
