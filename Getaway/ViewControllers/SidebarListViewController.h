//
// Created by Seb Insua on 01/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <UIKit/UIKit.h>


@interface SidebarListViewController : UITableViewController <UINavigationControllerDelegate>

@property (strong, nonatomic) NSArray *menuItems;
@property (strong, nonatomic) NSString *currentCentreViewControllerName;

- (void)configureView;

- (void)hideSidebar;
- (IBAction) logout;

@end