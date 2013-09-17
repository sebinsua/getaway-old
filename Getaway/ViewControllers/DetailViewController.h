//
//  DetailViewController.h
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXBlurView.h"

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *bookButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollArea;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet FXBlurView *blurredView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextView *description;

- (IBAction) book:(id)sender;

- (void)configureView;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture;

@end
