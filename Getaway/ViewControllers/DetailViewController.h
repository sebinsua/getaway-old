//
//  DetailViewController.h
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"
#import "IIViewDeckController.h"

#import "BookButton.h"

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet FXBlurView *blurredView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollArea;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextView *description;

@property (weak, nonatomic) IBOutlet BookButton *bookButton;

- (void)configureView;
- (void)layoutForDetailItem;
- (void)configureScrollMask;

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture;
- (IBAction) book:(id)sender;

@end
