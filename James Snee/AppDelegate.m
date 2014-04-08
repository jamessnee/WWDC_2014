//
//  AppDelegate.m
//  James Snee
//
//  Created by James Snee on 03/04/2014.
//
//

#import "AppDelegate.h"

@implementation AppDelegate

#pragma mark - View State
- (void)resetViewType
{
    [self switchViewType:kVIEW_STATE_STANDARD];
}

- (void)switchViewType:(NSString *)type
{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if ([type  isEqual: kVIEW_STATE_STANDARD] || [type  isEqual: kVIEW_STATE_CLASSIC])
//        [defaults setObject:type forKey:kVIEW_STATE_KEY];
    return;
}

- (NSString *)getViewState
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:kVIEW_STATE_KEY];
}

#pragma mark - App Lifecycle
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Make sure we start in the standard view
    [self resetViewType];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
