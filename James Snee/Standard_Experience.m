//
//  Standard_Experience.m
//  James Snee
//
//  Created by James Snee on 06/04/2014.
//
//

#import <QuartzCore/QuartzCore.h>
#import "Standard_Experience.h"
#import "Standard_Experience_SubV.h"

@interface Standard_Experience ()
@property (strong)Standard_Experience_SubV *content;

@end

@implementation Standard_Experience

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Show a colored view at the top behind the status bar
    UIView *statusBarV = [[UIView alloc] initWithFrame:[[UIApplication sharedApplication] statusBarFrame]];
    [statusBarV setBackgroundColor:[UIColor colorWithRed:236/255.0 green:189/255.0 blue:0 alpha:1]];
    [self.view addSubview:statusBarV];
    
    // Get the subview
    NSArray *viewComps = [[NSBundle mainBundle] loadNibNamed:@"Standard_Experience_SubV" owner:self options:nil];
    for (UIView *v in viewComps) {
        if (v.tag == 1337) {
            self.content = (Standard_Experience_SubV *)v;
            break;
        }
    }
    // Change it's frame to fit our view
    CGRect contentFr = CGRectMake(0, 64, 320, self.content.bounds.size.height);
    [self.content setFrame:contentFr];
    
    // Setup the top scroll
    [self.content.topScroll addSubview:self.content.topContent];
    [self.content.topScroll setContentSize:self.content.topContent.bounds.size];
    
    
    /*
     * App specific scrollviews
     */
    //Menu
    NSArray *btns = @[self.content.weather, self.content.scalebox, self.content.hay, self.content.ucamlib];
    for (UIButton *btn in btns) {
        [btn.layer setCornerRadius:10];
        [btn setClipsToBounds:YES];
        [btn addTarget:self action:@selector(appClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // DTG Weather
    [self.content.weatherScroll setContentSize:self.content.weatherView.bounds.size];
    [self.content.weatherScroll setDelegate:self];
    
    // ScaleBox
    [self.content.scaleboxScroll setContentSize:self.content.scaleboxView.bounds.size];
    [self.content.scaleboxScroll setDelegate:self];
    
    // UCAM Lib
    [self.content.ucamlibScroll setContentSize:self.content.ucamlibView.bounds.size];
    [self.content.ucamlibScroll setDelegate:self];
    
    [self.view addSubview:self.content];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)popView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)appClicked:(id)sender
{
    // DTG Weather - 85
    // ScaleBox - 390
    // Hay - 597
    // Ucam - 734
    CGPoint point;
    if (sender == self.content.weather)
        point = CGPointMake(0, 85);
    else if (sender == self.content.scalebox)
        point = CGPointMake(0, 390);
    else if (sender == self.content.hay)
        point = CGPointMake(0, 597);
    else if (sender == self.content.ucamlib)
        point = CGPointMake(0, 734);
    
    [self.content.topScroll setContentOffset:point animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = lroundf(scrollView.contentOffset.x/scrollView.frame.size.width);
    if (scrollView == self.content.weatherScroll)
        [self.content.weatherPage setCurrentPage:page];
    else if (scrollView == self.content.scaleboxScroll)
        [self.content.scaleboxPage setCurrentPage:page];
    else if (scrollView == self.content.ucamlibScroll)
        [self.content.ucamlibPage setCurrentPage:page];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
