//
//  AppDelegate.h
//  James Snee
//
//  Created by James Snee on 03/04/2014.
//
//

#import <UIKit/UIKit.h>

#define kVIEW_STATE_STANDARD @"kVIEW_STATE_STANDARD"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)resetViewType;
- (void)switchViewType;
- (BOOL)isViewStandard;

@end
