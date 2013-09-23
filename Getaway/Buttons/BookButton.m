//
// Created by Seb Insua on 23/09/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "BookButton.h"


@implementation BookButton {

}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        UIImage *buttonImage = [UIImage imageNamed:@"button.png"];
        UIButton *bookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bookButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [bookButton setTitle:@"Lets getaway!" forState:UIControlStateNormal];
        [bookButton.titleLabel setFont: [UIFont boldSystemFontOfSize:18.0] ];
        [bookButton setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
        [self setCustomView:bookButton];
    }

    return self;
}
@end