//
//  BrowseListViewController.m
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import "BrowseListViewController.h"

@implementation BrowseListViewController

@synthesize holidays;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.holidays = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configurePullToRefresh];
    [self configureView];
    [self loadHolidays];
}

- (void)configureView
{
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
}

- (void)configurePullToRefresh
{
    self.refreshHeaderHeight = 40.0f;
    [self addPullToRefreshHeader];
    [self.refreshArrow initWithImage: [UIImage imageNamed: @"empty.png"]];
    [self.refreshLabel setFont: [UIFont systemFontOfSize: 12.0]];
    [self.refreshLabel setTextColor: [UIColor colorFromHexCode: @"#c1c1c1"]];
}

- (void)loadHolidays
{
    [self.holidays addObject: @{
            @"name": @"Paris",
            @"image_small": @"paris.png",
            @"image_large": @"paris_large.png",
            @"price": @"£200",
            @"description": @"Paris was, is and always will be, something rather special. To get the \"feel\" of Paris you"
                    " will visit old Montmartre, for this is the home of the artists and street entertainers. Picturesque"
                    " squares where the eaves of the houses almost touch and the unmistakable smell of fresh coffee and"
                    " croissants drifts from the numerous brasseries. The Latin Quarter has an atmosphere all of its own:"
                    " tiny cobbled streets, crammed with restaurants and bistros...\n"
                    "\n"
                    "There is so much to see and do, you will leave Paris with sore feet."
    }];
    [self.holidays addObject: @{
            @"name": @"Amsterdam",
            @"image_small": @"amsterdam.png",
            @"image_large": @"amsterdam_large.png",
            @"price": @"£220",
            @"description": @"Amsterdam works its fairy-tale magic in many ways: via the gabled, Golden Age buildings;"
                    " glinting, boat-filled canals; and especially the cosy, centuries-old brown cafes, where candles"
                    " burn low and beers froth high. Add in mega art museums and funky street markets, and it's"
                    " easy to see why this atmospheric city is one of Europe's most popular getaways."
    }];
    [self.holidays addObject: @{
            @"name": @"Berlin",
            @"image_small": @"berlin.png",
            @"image_large": @"berlin_large.png",
            @"price": @"£250",
            @"description": @"Berlin is a scene-stealing, head-turning combo of glamour and grit,"
                    " teaming with top museums and galleries, grand opera and guerrilla clubs,"
                    " gourmet temples and ethnic snack shacks. Sleep? Forget about it!"
                    " Instead discover why the Reichstag was wrapped in silver fabric for 14 days"
                    " or dine in a secret restaurant where the host serves you supper in their own home."
                    " And if you really must sleep, try inside a kaleidoscope, prison cell or coffin at Berlin's"
                    " most unusual hotel."
    }];
}

- (IBAction)revealSidebar:(UIBarButtonItem *)sender
{
    // [self.viewDeckController toggleLeftViewAnimated:YES];
}

-(IBAction)love:(UIButton *)sender
{
    if ([sender.accessibilityIdentifier isEqualToString: @"heartOn"]) {
        [sender setImage: [UIImage imageNamed: @"heart_off.png"] forState:UIControlStateNormal];
        [sender setAccessibilityIdentifier: @"heartOff"];
    } else {
        [sender setImage: [UIImage imageNamed: @"heart_on.png"] forState:UIControlStateNormal];
        [sender setAccessibilityIdentifier: @"heartOn"];
    }
    
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
        cell = [[DetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    NSDictionary *holiday = [self.holidays objectAtIndex: (NSUInteger) indexPath.item];
    if (holiday != nil) {
        NSString *name = [holiday objectForKey: @"name"];
        [cell.titleLabel setText:name];

        NSString *price = [holiday objectForKey: @"price"];
        [cell.priceLabel setText: price];

        NSString *imageName = [holiday objectForKey: @"image_small"];
        [cell setBackground:imageName];
    }

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Always make sure that the sidebar is not open.
    // if ([self.viewDeckController isSideOpen:IIViewDeckLeftSide]) {
    //     [self.viewDeckController toggleLeftViewAnimated:YES];
    // }

    if ([[segue identifier] isEqualToString:@"showOverviewSegue"]) {
        [self segueToHolidayWithSegue:segue];
    }
}

- (void)segueToHolidayWithSegue:(UIStoryboardSegue *)segue
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *object = [self.holidays objectAtIndex: (NSUInteger) indexPath.row];
    [[segue destinationViewController] setDetailItem: object];
}

@end
