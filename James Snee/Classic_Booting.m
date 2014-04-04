//
//  Classic_Booting.m
//  James Snee
//
//  Created by James Snee on 05/04/2014.
//
//

#import "Classic_Booting.h"

@interface Classic_Booting ()
@property (strong) NSTimer *timer;
@end

@implementation Classic_Booting

int width = 0;

+(UIImage *)imageFromColor:(UIColor *)color andRect:(CGRect)rect {
//    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    //  [[UIColor colorWithRed:222./255 green:227./255 blue: 229./255 alpha:1] CGColor]) ;
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return img;
}

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
    
    UIFont *font = [UIFont fontWithName:@"ChicagoFLF" size:17];
    [self.booting setFont:font];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
}

- (void)timerFire
{
    if (arc4random() % 2) {
        int toAdd = arc4random() % (15 - 5) + 5;
        width = width + toAdd;
        if (width < 184) {
            UIImage *img = [Classic_Booting imageFromColor:[UIColor blackColor] andRect:CGRectMake(0, 0, width, 20)];
            [self.bootingProgress setContentMode:UIViewContentModeTopLeft];
            [self.bootingProgress setImage:img];
        } else {
            [self.timer invalidate];
            width = 0;
            [self performSegueWithIdentifier:@"showClassicHome" sender:self];
        }
    }
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
