//
//  BrowseListViewController.h
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PullRefreshTableViewController.h"

@class DetailCell;

@interface BrowseListViewController : PullRefreshTableViewController

@property (strong, nonatomic) NSMutableArray *holidays;

- (IBAction)revealSideBar:(UIBarButtonItem *)sender;

- (IBAction)love:(UIButton *)sender;

@end
