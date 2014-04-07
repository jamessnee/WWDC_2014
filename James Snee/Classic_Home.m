//
//  Classic_Home.m
//  James Snee
//
//  Created by James Snee on 05/04/2014.
//
//

#import "Classic_Home.h"

#define kMANUAL_SCROLL_DELTA 10
#define kMANUAL_SCROLL_MAX 230
#define KMANUAL_SCROLL_MIN 0

@interface Classic_Home ()

@end

@implementation Classic_Home

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
    
    [self.contentScroll setContentSize:CGSizeMake(320, 800)];
    
    CGRect statusFrame = [[UIApplication sharedApplication] statusBarFrame];
    UIView *solidStatusBar = [[UIView alloc] initWithFrame:statusFrame];
    [solidStatusBar setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:solidStatusBar];
    
    UIFont *classicFont = [UIFont fontWithName:@"ChicagoFLF" size:15];
    UIFont *classicFontLarge = [UIFont fontWithName:@"ChicagoFLF" size:20];
    [self.standard.titleLabel setFont:classicFont];
    [self.shortBio setFont:classicFont];
    
    NSArray *toStyle = @[self.menu_1,self.menu_2,self.menu_3,self.menu_4,self.menu_5];
    for (UIButton *btn in toStyle) {
        [btn.titleLabel setFont:classicFont];
    }
    
    [self.name setFont:classicFontLarge];
    
}

- (IBAction)makeStandard:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (IBAction)scrollUp:(id)sender
{
    int scrollP = self.contentScroll.contentOffset.y + kMANUAL_SCROLL_DELTA;
    if (scrollP < kMANUAL_SCROLL_MAX)
        [self.contentScroll setContentOffset:CGPointMake(0, scrollP)];
}

- (IBAction)scrollDown:(id)sender
{
    int scrollP = self.contentScroll.contentOffset.y + (1 - kMANUAL_SCROLL_DELTA);
    if (scrollP > KMANUAL_SCROLL_MIN)
        [self.contentScroll setContentOffset:CGPointMake(0, scrollP)];
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
