//
//  AppDelegate.h
//  James Snee
//
//  Created by James Snee on 03/04/2014.
//
//

#import <UIKit/UIKit.h>

#define kVIEW_STATE_KEY @"kVIEW_STATE"
#define kVIEW_STATE_STANDARD @"kVIEW_STATE_STANDARD"
#define kVIEW_STATE_CLASSIC @"kVIEW_STATE_CLASSIC"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)resetViewType;
- (void)switchViewType:(NSString *)type;
- (NSString *)getViewState;

@end
