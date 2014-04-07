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
@property (strong)IBOutlet UIImageView *fgNameBg;

// Menu
@property (strong)IBOutlet UIButton *menu_1;
@property (strong)IBOutlet UIButton *menu_2;
@property (strong)IBOutlet UIButton *menu_3;
@property (strong)IBOutlet UIButton *menu_4;
@property (strong)IBOutlet UIButton *menu_5;

- (void)setupParallaxForView:(UIView *)view magnitude:(int)mag;
- (void)setupScrollViews;
- (void)blurStatusBar;
- (void)drawBlurredImage;
- (void)openWebURL:(NSString *)url_s;

// Event Handlers
- (IBAction)openGithub:(id)sender;
- (IBAction)openTwitter:(id)sender;
- (IBAction)openLinkedin:(id)sender;

@end
