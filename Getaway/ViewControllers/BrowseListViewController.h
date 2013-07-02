//
//  BrowseListViewController.h
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailCell;

@interface BrowseListViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *holidays;

- (IBAction)revealSideBar:(UIBarButtonItem *)sender;

@end
