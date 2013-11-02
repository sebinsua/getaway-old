//
// Created by Seb Insua on 23/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "YourTicketsViewController.h"
#import "UIViewController+MMDrawerController.h"

@implementation YourTicketsViewController {

}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender
{
    [self.mm_drawerController toggleDrawerSide: MMDrawerSideLeft animated: YES completion: nil];
}

@end