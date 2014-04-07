//
//  Standard_Skills.m
//  James Snee
//
//  Created by James Snee on 06/04/2014.
//
//

#import "Standard_Skills.h"

@interface Standard_Skills ()

@end

@implementation Standard_Skills

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
    UIView *statusBarV = [[UIView alloc] initWithFrame:[[UIApplication sharedApplication] statusBarFrame]];
    [statusBarV setBackgroundColor:[UIColor colorWithRed:88/255.0 green:86/255.0 blue:214/255.0 alpha:1]];
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
