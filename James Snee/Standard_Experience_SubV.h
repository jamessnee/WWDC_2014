//
//  Standard_Experience_SubV.h
//  James Snee
//
//  Created by James Snee on 08/04/2014.
//
//

#import <UIKit/UIKit.h>

@interface Standard_Experience_SubV : UIView

@property (strong)IBOutlet UIScrollView *topScroll;
@property (strong)IBOutlet UIView *topContent;

// App Menu
@property (strong)IBOutlet UIButton *weather;
@property (strong)IBOutlet UIButton *scalebox;
@property (strong)IBOutlet UIButton *hay;
@property (strong)IBOutlet UIButton *ucamlib;

// Weather
@property (strong)IBOutlet UIScrollView *weatherScroll;
@property (strong)IBOutlet UIView *weatherView;
@property (strong)IBOutlet UIPageControl *weatherPage;

// ScaleBox
@property (strong)IBOutlet UIScrollView *scaleboxScroll;
@property (strong)IBOutlet UIView *scaleboxView;
@property (strong)IBOutlet UIPageControl *scaleboxPage;

// UCAM Lib
@property (strong)IBOutlet UIScrollView *ucamlibScroll;
@property (strong)IBOutlet UIView *ucamlibView;
@property (strong)IBOutlet UIPageControl *ucamlibPage;

// 

@end
