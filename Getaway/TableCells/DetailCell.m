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

- (void)setBackground:imageName
{
    UIImage *image = [UIImage imageNamed: imageName];
    [self.backgroundImage initWithImage:image];

    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.backgroundImage.bounds;
    gradient.colors = @[
            (id) [UIColor colorWithWhite: 0 alpha: 0].CGColor,
            (id) [UIColor colorWithWhite: 0 alpha: 0.5].CGColor
    ];

    // The last 50 percent of the image is darkened. :)
    gradient.startPoint = CGPointMake(0, 0.5f);
    gradient.endPoint = CGPointMake(0, 1.0f);
    [self.backgroundImage.layer addSublayer: gradient];
}

@end