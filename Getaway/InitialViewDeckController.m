//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "InitialViewDeckController.h"


@implementation InitialViewDeckController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self = [super initWithCenterViewController:[storyboard instantiateViewControllerWithIdentifier:@"browseViewController"]
                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"sidebarViewController"]];
    if (self) {
        [self setLeftSize: 160];
    }
    return self;
}


@end