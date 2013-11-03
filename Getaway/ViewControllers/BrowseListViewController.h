//
//  BrowseListViewController.h
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+FlatUI.h"
#import "PullRefreshTableViewController.h"

#import "DetailCell.h"
#import "DetailViewController.h"

@interface BrowseListViewController : PullRefreshTableViewController

@property (strong, nonatomic) NSMutableArray *holidays;

- (void)configureView;
- (void)loadHolidays;
- (void)segueToHolidayWithSegue:(UIStoryboardSegue *)segue;

- (IBAction)revealSidebar:(UIBarButtonItem *)sender;
- (IBAction)love:(UIButton *)sender;

@end
