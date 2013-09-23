//
// Created by Seb Insua on 09/06/2013.
// Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <UIKit/UIKit.h>
#import "InitialViewDeckController.h"
#import "AnimatedDarkenBackgroundView.h"

#import "FlatUIKit.h"

@interface InitialViewController : UIViewController

@property IBOutlet AnimatedDarkenBackgroundView *background;

@property IBOutlet UIImageView *logo;
@property IBOutlet FUIButton *loginButton;

@property InitialViewDeckController *initialViewDeckController;

- (IBAction)start;

@end