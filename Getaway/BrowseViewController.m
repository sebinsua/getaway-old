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
    NSMutableArray *items;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.items = [[NSMutableArray alloc] init];
    [self.items addObject: @"HARDCODED TEXT1"];
    [self.items addObject: @"HARDCODED TEXT2"];
    [self.items addObject: @"HARDCODED TEXT3"];
    [self.items addObject: @"HARDCODED TEXT4"];
    [self.items addObject: @"HARDCODED TEXT5"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"detailCell";
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        DetailCell *cell = [[DetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    NSString *name = [self.items objectAtIndex: indexPath.item];
    UIImage *image = [UIImage imageNamed: @"holiday.png"];
    [cell.detailLabel setText: name];
    [cell.detailImage initWithImage: image];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.items[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
