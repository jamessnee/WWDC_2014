//
//  Classic_Experience.m
//  James Snee
//
//  Created by James Snee on 07/04/2014.
//
//

#import "Classic_Experience.h"

@interface Classic_Experience ()

@end

@implementation Classic_Experience

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

    UIFont *classicFont = [UIFont fontWithName:@"ChicagoFLF" size:15];
    [self.headerBtn.titleLabel setFont:classicFont];
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
