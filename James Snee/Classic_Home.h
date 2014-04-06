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
@property (strong)IBOutlet UILabel *shortBio;

- (IBAction)makeStandard:(id)sender;
- (IBAction)scrollUp:(id)sender;
- (IBAction)scrollDown:(id)sender;

@end
