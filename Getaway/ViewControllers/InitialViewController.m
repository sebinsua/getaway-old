//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Getaway App Ltd. All rights reserved.
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
}

- (IBAction)start
{
    [self presentViewController: self.initialViewDeckController animated:NO completion:nil];
}

@end