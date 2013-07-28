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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self.initialViewDeckController = [storyboard instantiateViewControllerWithIdentifier:@"initialViewDeckController"];

    self.view.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"intro_background.png"] ];
    self.loginButton.buttonColor = [UIColor colorFromHexCode: (NSString *) @"#3B5998"];
    self.loginButton.shadowColor = [UIColor colorFromHexCode: (NSString *) @"#263A66"];
    self.loginButton.shadowHeight = 3.0f;
    self.loginButton.cornerRadius = 6.0f;
}

- (IBAction)start
{
    [self.initialViewDeckController setModalTransitionStyle: UIModalTransitionStyleCrossDissolve];
    [self presentViewController: self.initialViewDeckController animated:YES completion:nil];
}

@end