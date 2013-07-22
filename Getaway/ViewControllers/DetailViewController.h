//
//  DetailViewController.h
//  Getaway
//
//  Created by Seb Insua on 09/06/2013.
//  Copyright (c) 2013 Momentum Labs Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *bookButton;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollArea;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIView *darkenedView;

@property (weak, nonatomic) IBOutlet UIImageView *foregroundImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UITextView *description;

- (IBAction) customBack:(id)sender;
- (IBAction) book:(id)sender;

- (void)configureView;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;

@end
