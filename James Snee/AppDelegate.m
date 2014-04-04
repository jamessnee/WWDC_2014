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
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:kVIEW_STATE_STANDARD];
}

- (void)switchViewType
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults boolForKey:kVIEW_STATE_STANDARD])
        [defaults setBool:NO forKey:kVIEW_STATE_STANDARD];
    else
        [defaults setBool:YES forKey:kVIEW_STATE_STANDARD];
}

- (BOOL)isViewStandard
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:kVIEW_STATE_STANDARD];
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
