//
//  BrowseViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Getaway App Ltd. All rights reserved.
//

#import "BrowseViewController.h"
#import <ViewDeck/IIViewDeckController.h>

#import "DetailViewController.h"
#import "DetailCell.h"

@implementation BrowseViewController {
    NSMutableArray *holidays;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // w * h: 612 * 482

    self.holidays = [[NSMutableArray alloc] init];
    [self.holidays addObject: @"HARDCODED TEXT1"];
    [self.holidays addObject: @"HARDCODED TEXT2"];
    [self.holidays addObject: @"HARDCODED TEXT3"];
    [self.holidays addObject: @"HARDCODED TEXT4"];
    [self.holidays addObject: @"HARDCODED TEXT5"];
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender
{
    [self.viewDeckController toggleLeftViewAnimated:YES];
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

    NSString *name = [self.holidays objectAtIndex: indexPath.item];
    UIImage *image = [UIImage imageNamed: @"holiday.png"];
    [cell.detailLabel setText: name];
    [cell.detailImage initWithImage: image];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showOverviewSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.holidays[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
