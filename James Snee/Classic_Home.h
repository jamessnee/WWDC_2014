//
//  Classic_Home.h
//  James Snee
//
//  Created by James Snee on 05/04/2014.
//
//

#import <UIKit/UIKit.h>

@interface Classic_Home : UIViewController <UIScrollViewDelegate>

@property (strong)IBOutlet UIButton *standard;
@property (strong)IBOutlet UIScrollView *contentScroll;

// UI content for font styling
@property (strong)IBOutlet UILabel *name;
@property (strong)IBOutlet UILabel *shortBio;
@property (strong)IBOutlet UIButton *menu_1;
@property (strong)IBOutlet UIButton *menu_2;
@property (strong)IBOutlet UIButton *menu_3;
@property (strong)IBOutlet UIButton *menu_4;
@property (strong)IBOutlet UIButton *menu_5;


- (IBAction)makeStandard:(id)sender;
- (IBAction)scrollUp:(id)sender;
- (IBAction)scrollDown:(id)sender;

@end
