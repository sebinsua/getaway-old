//
// Created by Seb Insua on 23/09/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AnimatedDarkenBackgroundView.h"


@implementation AnimatedDarkenBackgroundView {

}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    if (self) {
        CABasicAnimation *flash = [CABasicAnimation animationWithKeyPath:@"opacity"];
        flash.fromValue = [NSNumber numberWithFloat:0.0];
        flash.toValue = [NSNumber numberWithFloat:1.0];
        flash.duration = 1.25f;

        CALayer *darkenLayer = [CALayer layer];
        darkenLayer.frame = self.bounds;
        darkenLayer.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4f].CGColor;
        [darkenLayer addAnimation:flash forKey:@"darkenAnimation"];

        [self.layer addSublayer: darkenLayer];
    }

    return self;
}

@end