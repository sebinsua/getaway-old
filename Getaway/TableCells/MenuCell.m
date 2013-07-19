//
// Created by Seb Insua on 01/07/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MenuCell.h"


@implementation MenuCell {

}

- (void)layoutSubviews
{
    [super layoutSubviews];

    UIColor *lightBlue = [UIColor colorWithRed:40/255.0f
                                         green:183/255.0f
                                          blue:234/255.0f
                                         alpha:1.0];
    UIColor *darkBlue = [UIColor colorWithRed:33/255.0f
                                         green:148/255.0f
                                          blue:210/255.0f
                                         alpha:1.0];

    UIView *selectedView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [selectedView setBackgroundColor:darkBlue];

    [self setSelectedBackgroundView: selectedView];
    [self setBackgroundColor: lightBlue];
    [self.textLabel setTextColor: [UIColor whiteColor]];
}

@end