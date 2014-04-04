//
//  ViewController.h
//  James Snee
//
//  Created by James Snee on 03/04/2014.
//
//

#import <UIKit/UIKit.h>

#define kSCROLL_FACTOR 2

@interface Standard_Home : UIViewController <UIScrollViewDelegate>

@property (strong)IBOutlet UIView *topView;
@property (strong)IBOutlet UIImageView *imgJames;
@property (strong)IBOutlet UIScrollView *bgScroll;
@property (strong)IBOutlet UIScrollView *fgScroll;
@property (strong)IBOutlet UIView *fgContainer;
@property (strong)IBOutlet UILabel *fgLabel;

- (void)setupParallax;
- (void)setupScrollViews;
- (void)drawBlurredImage;

// Event handlers
- (IBAction)makeClassic:(id)sender;

@end
