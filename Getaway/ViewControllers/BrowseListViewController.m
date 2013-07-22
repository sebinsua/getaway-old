//
//  BrowseListViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
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

    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];

    self.holidays = [[NSMutableArray alloc] init];
    [self.holidays addObject: @{
            @"name": @"Paris",
            @"image_small": @"paris.png",
            @"image_large": @"paris_large.png",
            @"price": @"£190",
            @"description": @"Paris was, is and always will be, something rather special. To get the \"feel\" of Paris you"
                    " will visit old Montmartre, for this is the home of the artists and street entertainers. Picturesque"
                    " squares where the eaves of the houses almost touch and the unmistakable smell of fresh coffee and"
                    " croissants drifts from the numerous brasseries. The Latin Quarter has an atmosphere all of its own:"
                    " tiny cobbled streets, crammed with restaurants and bistros.\n"
                    "\n"
                    "There is so much to see and do, you will leave Paris with sore feet, but once having had a taste,"
                    " you will always want to come back for more. It is everything you imagine it to be, romantic,"
                    " inspiring, vibrant even outrageous, but best of all Paris is simply unique."
    }];
    [self.holidays addObject: @{
            @"name": @"Berlin",
            @"image_small": @"berlin.png",
            @"image_large": @"paris_large.png",
            @"price": @"£250",
            @"description": @""
    }];
    [self.holidays addObject: @{
            @"name": @"Amsterdam",
            @"image_small": @"amsterdam.png",
            @"image_large": @"paris_large.png",
            @"price": @"£320",
            @"description": @""
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
