//
//  AppDelegate.m
//  YKPlaceholderView
//
//  Created by Kevin on 2021/5/11.
//

#import "AppDelegate.h"
#import "TableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    TableViewController *uikitViewController = [[TableViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:uikitViewController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
