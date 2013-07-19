//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "DetailCell.h"


@implementation DetailCell

@synthesize backgroundImage;
@synthesize titleLabel;
@synthesize priceLabel;

- (void)layoutSubviews
{
    [self.titleLabel setTextColor: [UIColor whiteColor]];
    [self.titleLabel setFont:[UIFont systemFontOfSize: 32]];

    [self.priceLabel setTextColor: [UIColor whiteColor]];
    [self.priceLabel setFont:[UIFont systemFontOfSize: 14]];
}

@end