//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "InitialViewDeckController.h"


@implementation InitialViewDeckController


- (id)initWithCoder:(NSCoder *)aDecoder
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    self = [super initWithCenterViewController:[storyboard instantiateViewControllerWithIdentifier:@"browseNavigationViewController"]
                            leftViewController:[storyboard instantiateViewControllerWithIdentifier:@"sidebarNavigationViewController"]];
    if (self) {
        [self setLeftSize: 160];
        // [self setOpenSlideAnimationDuration: 1.0f];
        // [self setCloseSlideAnimationDuration: 1.0f];
    }
    return self;
}


@end