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
@end

@implementation Standard_Home

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self setupParallax];
    
    // Blur the statusbar
    CGRect statusFrame = [[UIApplication sharedApplication] statusBarFrame];
    UIToolbar *bgToolbar = [[UIToolbar alloc] initWithFrame:statusFrame];
    [bgToolbar setBarStyle:UIBarStyleDefault];
    [self.view addSubview:bgToolbar];
    
    [self setupScrollViews];
}

#pragma mark - Event Handlers
- (IBAction)makeClassic:(id)sender
{
    
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offsetBg = self.bgScroll.contentOffset;
    offsetBg.y = self.fgScroll.contentOffset.y / kSCROLL_FACTOR;
    [self.bgScroll setContentOffset:offsetBg];
    
    [self drawBlurredImage];
}

#pragma mark - Helpers
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
    [self.fgScroll setContentSize:CGSizeMake(320, 825)];
}

- (void)setupParallax
{
    self.fgContainer.layer.shadowOffset = CGSizeMake(1, 1);
    self.fgContainer.layer.shadowRadius = 4;
    self.fgContainer.layer.shadowOpacity = 0.5;
    
    UIInterpolatingMotionEffect *vertMotion = [[UIInterpolatingMotionEffect alloc]
                                               initWithKeyPath:@"center.y"
                                               type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    vertMotion.minimumRelativeValue = @(-20);
    vertMotion.maximumRelativeValue = @(20);
    
    UIInterpolatingMotionEffect *horizMotion = [[UIInterpolatingMotionEffect alloc]
                                                initWithKeyPath:@"center.x"
                                                type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizMotion.minimumRelativeValue = @(-20);
    horizMotion.maximumRelativeValue = @(20);
    
    UIMotionEffectGroup *motion = [UIMotionEffectGroup new];
    motion.motionEffects = @[vertMotion, horizMotion];
    
    [self.fgContainer addMotionEffect:motion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
