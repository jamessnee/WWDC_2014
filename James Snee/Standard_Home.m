//
//  ViewController.m
//  James Snee
//
//  Created by James Snee on 03/04/2014.
//
//

#import "Standard_Home.h"

@interface Standard_Home ()
@property (strong) UIImageView *blurredImage;
@property (strong) UIView *blurredView;
@property (strong) UIView *whiteView;
@property (strong) UIDynamicAnimator *animator;
@end

@implementation Standard_Home

#pragma mark - View life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupParallaxForView:self.fgNameBg magnitude:10];
    [self setupParallaxForView:self.fgLabel magnitude:20];
    [self blurStatusBar];
    [self setupScrollViews];
}

/* 
 * Reset the menu items so the awesome animation can happen!
 */
- (void)viewWillAppear:(BOOL)animated
{
    CGRect menu_1_fr = CGRectMake(-320, 211, 320, 44);
    [self.menu_1 setFrame:menu_1_fr];
    CGRect menu_2_fr = CGRectMake(320, 272, 320, 44);
    [self.menu_2 setFrame:menu_2_fr];
    CGRect menu_3_fr = CGRectMake(-320, 333, 320, 44);
    [self.menu_3 setFrame:menu_3_fr];
    CGRect menu_4_fr = CGRectMake(320, 394, 320, 44);
    [self.menu_4 setFrame:menu_4_fr];
    CGRect menu_5_fr = CGRectMake(-320, 455, 320, 44);
    [self.menu_5 setFrame:menu_5_fr];
}

- (void)viewDidAppear:(BOOL)animated
{
    CGRect menu_1_fr = CGRectMake(0, 211, 320, 44);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^(){
        [self.menu_1 setFrame:menu_1_fr];
    }completion:nil];
    
    CGRect menu_2_fr = CGRectMake(0, 272, 320, 44);
    [UIView animateWithDuration:0.2 delay:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^(){
        [self.menu_2 setFrame:menu_2_fr];
    }completion:nil];
    
    if (self.fgScroll.contentOffset.y > 60) {
        CGRect menu_3_fr = CGRectMake(0, 333, 320, 44);
        [UIView animateWithDuration:0.2 delay:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^(){
            [self.menu_3 setFrame:menu_3_fr];
        }completion:nil];
    }
    
    if (self.fgScroll.contentOffset.y > 120) {
        CGRect menu_4_fr = CGRectMake(0, 394, 320, 44);
        [UIView animateWithDuration:0.2 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^(){
            [self.menu_4 setFrame:menu_4_fr];
        }completion:nil];
    }
    
    if (self.fgScroll.contentOffset.y > 182) {
        CGRect menu_5_fr = CGRectMake(0, 455, 320, 44);
        [UIView animateWithDuration:0.2 delay:0.4 options:UIViewAnimationOptionCurveEaseOut animations:^(){
            [self.menu_5 setFrame:menu_5_fr];
        }completion:nil];
    }
}

#pragma mark - Event Handlers
- (IBAction)openGithub:(id)sender
{
    [self openWebURL:@"http://www.github.com/jamessnee"];
}

- (IBAction)openTwitter:(id)sender
{
    [self openWebURL:@"http://www.twitter.com/jamssn"];
}

- (IBAction)openLinkedin:(id)sender
{
    [self openWebURL:@"http://www.linkedin.com/pub/james-snee/2b/144/91"];
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offsetBg = self.bgScroll.contentOffset;
    offsetBg.y = self.fgScroll.contentOffset.y / kSCROLL_FACTOR;
    [self.bgScroll setContentOffset:offsetBg];
    
    [self drawBlurredImage];
    
    if (scrollView.contentOffset.y > 60 && self.menu_3.frame.origin.x < 0) {
        CGRect menu_3_fr = CGRectMake(0, 333, 320, 44);
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^(){
            [self.menu_3 setFrame:menu_3_fr];
        }completion:nil];
    }
    
    if (scrollView.contentOffset.y > 120 && self.menu_4.frame.origin.x > 0) {
        CGRect menu_4_fr = CGRectMake(0, 394, 320, 44);
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^(){
            [self.menu_4 setFrame:menu_4_fr];
        }completion:nil];
    }
    
    if (scrollView.contentOffset.y > 182 && self.menu_5.frame.origin.x < 0) {
        CGRect menu_5_fr = CGRectMake(0, 455, 320, 44);
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^(){
            [self.menu_5 setFrame:menu_5_fr];
        }completion:nil];
    }
}

#pragma mark - Helpers
- (void)blurStatusBar
{
    CGRect statusFrame = [[UIApplication sharedApplication] statusBarFrame];
    UIToolbar *bgToolbar = [[UIToolbar alloc] initWithFrame:statusFrame];
    [bgToolbar setBarStyle:UIBarStyleDefault];
    [self.view addSubview:bgToolbar];
}

/*
 * This function is designed to achieve a similar blur effect to various components of iOS7.
 * 3 seperate views are used to create the blur: 
 * 1. A blurred image view containing a pre-blurred version of the underlying image.
 * 2. A semi-transparent view with a white background that sits on top of view 1.
 * 3. A final view that contains the two views above. It clips them to the correct size.
 */
- (void)drawBlurredImage
{
    // Work-out how much of the blurred image we need to show
    CGRect origPic = [self.imgJames convertRect:self.imgJames.bounds toView:self.topView];
    int origBottom = origPic.origin.y + origPic.size.height;
    CGRect topLab = [self.fgContainer convertRect:self.fgContainer.bounds toView:self.topView];
    int fgTop = topLab.origin.y;
    int height = (origBottom - fgTop);
    
    if (height > 0) {
        CGRect blurFr = CGRectMake(0, 0, 320, height);
        
        if (!self.blurredImage) {
            self.blurredImage = [[UIImageView alloc] init];
            [self.blurredImage setImage:[UIImage imageNamed:@"james_banner_blur.png"]];
            [self.blurredImage setContentMode:UIViewContentModeTopLeft];
        }
        // Only draw the bottom part of the image we need
        CGRect blurImgFr = CGRectMake(0, 1 - (self.blurredImage.image.size.height - height), 320, 275);
        [self.blurredImage setFrame:blurImgFr];
        
        if (!self.whiteView) {
            self.whiteView = [[UIView alloc] init];
            [self.whiteView setBackgroundColor:[UIColor whiteColor]];
            [self.whiteView setAlpha:0.4];
        }
        [self.whiteView setFrame:blurFr];
        
        // Update the view that holds and clips the blurred image
        if (!self.blurredView) {
            self.blurredView = [[UIView alloc] initWithFrame:blurFr];
            [self.blurredView setClipsToBounds:YES];
            [self.fgContainer addSubview:self.blurredView];
            [self.fgContainer sendSubviewToBack:self.blurredView];
            [self.blurredView addSubview:self.blurredImage];
            [self.blurredView addSubview:self.whiteView];
        }
        else {
            [self.blurredView setFrame:blurFr];
            if (!self.blurredView.superview){
                [self.fgContainer addSubview:self.blurredView];
                [self.fgContainer sendSubviewToBack:self.blurredView];
            }
        }
    } else { // Negative height -> remove the blurred image
        [self.blurredView removeFromSuperview];
    }
}

- (void)setupScrollViews
{
    [self.bgScroll setContentSize:CGSizeMake(320, 800)];
    [self.fgScroll setContentSize:CGSizeMake(320, 840)];
}

- (void)setupParallaxForView:(UIView *)view magnitude:(int)mag;
{
    self.fgContainer.layer.shadowOffset = CGSizeMake(1, 1);
    self.fgContainer.layer.shadowRadius = 4;
    self.fgContainer.layer.shadowOpacity = 0.5;
    
    UIInterpolatingMotionEffect *vertMotion = [[UIInterpolatingMotionEffect alloc]
                                               initWithKeyPath:@"center.y"
                                               type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    vertMotion.minimumRelativeValue = @(1-mag);
    vertMotion.maximumRelativeValue = @(mag);
    
    UIInterpolatingMotionEffect *horizMotion = [[UIInterpolatingMotionEffect alloc]
                                                initWithKeyPath:@"center.x"
                                                type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizMotion.minimumRelativeValue = @(1-mag);
    horizMotion.maximumRelativeValue = @(mag);
    
    UIMotionEffectGroup *motion = [UIMotionEffectGroup new];
    motion.motionEffects = @[vertMotion, horizMotion];

    [view addMotionEffect:motion];
}

- (void)openWebURL:(NSString *)url_s
{
    NSURL *url = [NSURL URLWithString:url_s];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
