//
// Created by Seb Insua on 01/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SidebarListViewController.h"
#import "MenuCell.h"
#import "YourGetawayViewController.h"
#import <ViewDeck/IIViewDeckController.h>

@implementation SidebarListViewController

@synthesize menuItems;

- (void) viewDidLoad
{
    [super viewDidLoad];
    // The line below is in order that clicking on the centre panel does not do weird shit...
    [self.viewDeckController setCenterhiddenInteractivity:IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose];

    UIColor *lightBlue = [UIColor colorWithRed:40/255.0f
                                         green:183/255.0f
                                          blue:234/255.0f
                                         alpha:1.0];
    [self.tableView setBackgroundColor: lightBlue];

    self.currentCentreViewControllerName = @"browseNavigationViewController";
    self.menuItems = @[
        @{
            @"name": @"Getaways",
            @"viewController": @"browseNavigationViewController"
        },
        @{
            @"name": @"Your Tickets",
            @"viewController": @"yourGetawayViewController"
        },
        @{
            @"name": @"Help",
            @"viewController": @"browseNavigationViewController"
        },
        @{
            @"name": @"Settings",
            @"viewController": @"browseNavigationViewController"
        }
    ];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *object = (NSDictionary *) [self.menuItems objectAtIndex: indexPath.item];
    NSString *viewControllerName = [object valueForKey: @"viewController"];

    if (![self.currentCentreViewControllerName isEqualToString: viewControllerName]) {
        self.currentCentreViewControllerName = viewControllerName;
        self.viewDeckController.centerController = [self.storyboard instantiateViewControllerWithIdentifier: viewControllerName];
    }

    [self hideSidebar];
}

- (void)hideSidebar
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"showMenuScreen";
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        MenuCell *cell = [[MenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSDictionary *object = (NSDictionary *) [self.menuItems objectAtIndex: indexPath.item];
    NSString *name = [object valueForKey: @"name"];
    cell.textLabel.text = name;

    return cell;
}

@end