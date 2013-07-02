//
//  BrowseListViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//

#import "BrowseListViewController.h"
#import <ViewDeck/IIViewDeckController.h>

#import "DetailViewController.h"
#import "DetailCell.h"

@implementation BrowseListViewController

@synthesize holidays;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.holidays = [[NSMutableArray alloc] init];
    [self.holidays addObject: @{
            @"name": @"Paris",
            @"image_small": @"paris.png",
            @"image_large": @"paris_large.png",
            @"price": @"£190"
    }];
    [self.holidays addObject: @{
            @"name": @"Berlin",
            @"image_small": @"berlin.png",
            @"image_large": @"paris_large.png",
            @"price": @"£250"
    }];
    [self.holidays addObject: @{
            @"name": @"Amsterdam",
            @"image_small": @"amsterdam.png",
            @"image_large": @"paris_large.png",
            @"price": @"£320"
    }];
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender
{
    UINavigationController *navigationController = self.viewDeckController.leftController;
    UITableViewController *tableViewController = navigationController.topViewController;

    // Select the first item, when the view first loads.
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];

    [self.viewDeckController toggleLeftViewAnimated:YES];
    [tableViewController.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionBottom];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.holidays.count;
}

- (DetailCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"showOverview";
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        DetailCell *cell = [[DetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSDictionary *holiday = [self.holidays objectAtIndex: indexPath.item];
    if (holiday != nil) {
        NSString *name = [holiday objectForKey: @"name"];
        NSString *price = [holiday objectForKey: @"price"];
        NSString *imageName = [holiday objectForKey: @"image_small"];

        UIImage *image = [UIImage imageNamed: imageName];
        [cell.titleLabel setText:name];
        [cell.priceLabel setText: price];
        [cell.backgroundImage initWithImage:image];
    }

    // NSLog(@"%f - height", cell.frame.size.height);
    // NSLog(@"%f - width", cell.frame.size.width);
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([self.viewDeckController isSideOpen:IIViewDeckLeftSide]) {
        [self.viewDeckController toggleLeftViewAnimated:YES];
    }

    if ([[segue identifier] isEqualToString:@"showOverviewSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object = [self.holidays objectAtIndex: indexPath.row];
        [[segue destinationViewController] setDetailItem: object];
    }
}

@end
