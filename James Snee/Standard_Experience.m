//
//  Standard_Experience.m
//  James Snee
//
//  Created by James Snee on 06/04/2014.
//
//

#import "Standard_Experience.h"

@interface Standard_Experience ()

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
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)popView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
