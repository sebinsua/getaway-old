//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "InitialViewController.h"


@implementation InitialViewController {

}

- (void) viewDidLoad
{
    [self setNeedsStatusBarAppearanceUpdate];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self.initialViewDeckController = [storyboard instantiateViewControllerWithIdentifier:@"initialViewDeckController"];

    self.loginButton.buttonColor = [UIColor colorFromHexCode: (NSString *) @"#3B5998"];
    self.loginButton.shadowColor = [UIColor colorFromHexCode: (NSString *) @"#263A66"];
    self.loginButton.shadowHeight = 3.0f;
    self.loginButton.cornerRadius = 6.0f;

    CABasicAnimation *flash = [CABasicAnimation animationWithKeyPath:@"opacity"];
    flash.fromValue = [NSNumber numberWithFloat:0.0];
    flash.toValue = [NSNumber numberWithFloat:1.0];
    flash.duration = 1.25f;        // 1 second

    CALayer *darkenLayer = [CALayer layer];
    darkenLayer.frame = self.view.bounds;
    darkenLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4f].CGColor;
    [darkenLayer addAnimation:flash forKey:@"flashAnimation"];

    [self.background.layer addSublayer: darkenLayer];

    [UIView beginAnimations:@"fade in" context:nil];
    [UIView setAnimationDuration:2.5f];
    self.logo.alpha = 1.0;
    self.loginButton.alpha = 1.0;
    [UIView commitAnimations];
}

- (IBAction)start
{
    [self.initialViewDeckController setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
    [self presentViewController: self.initialViewDeckController animated:YES completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end