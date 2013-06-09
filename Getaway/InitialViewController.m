//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "InitialViewController.h"


@implementation InitialViewController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self = [super initWithCenterViewController:[storyboard instantiateViewControllerWithIdentifier:@"browseViewController"]
                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"sidebarViewController"]];
    [self setLeftSize: 160];
    if (self) {
        // Add any extra init code here
    }
    return self;
}


@end