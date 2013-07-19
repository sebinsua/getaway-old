//
// Created by Seb Insua on 01/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SidebarListViewController.h"
#import "MenuCell.h"
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

    self.menuItems = [[NSMutableArray alloc] init];
    [self.menuItems addObject:@"Getaways"];
    [self.menuItems addObject:@"Your Tickets"];
    [self.menuItems addObject:@"Help"];
    [self.menuItems addObject:@"Settings"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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

    NSString *name = [self.menuItems objectAtIndex: indexPath.item];
    cell.textLabel.text = name;

    return cell;
}

@end