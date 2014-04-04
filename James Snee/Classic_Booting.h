//
//  Classic_Booting.h
//  James Snee
//
//  Created by James Snee on 05/04/2014.
//
//

#import <UIKit/UIKit.h>

@interface Classic_Booting : UIViewController

@property (strong)IBOutlet UILabel *booting;
@property (strong)IBOutlet UIImageView *bootingProgress;

- (void)timerFire;

@end
