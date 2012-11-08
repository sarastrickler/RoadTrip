//
//  RTAppDelegate.m
//  RoadTrip
//
//  Created by Sara Pendleton Strickler on 11/7/12.
//  Copyright (c) 2012 Sara Pendleton Strickler. All rights reserved.
//

#import "RTAppDelegate.h"
#import "RTPackingListViewController.h"
#import "RTActivitiesViewController.h"
#import "RTMapViewController.h"

@implementation RTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    RTPackingListViewController *packingListViewController = [[RTPackingListViewController alloc] initWithNibName:@"RTPackingListViewController" bundle:nil];
    UINavigationController *packingListNavigationController = [[UINavigationController alloc] initWithRootViewController: packingListViewController];
    
    RTActivitiesViewController *activitiesListViewController = [[RTActivitiesViewController alloc] initWithNibName:@"RTActivitiesViewController" bundle:nil];
    UINavigationController *activitiesListNavigationController = [[UINavigationController alloc] initWithRootViewController: activitiesListViewController];
    
    RTMapViewController *mapViewController = [[RTMapViewController alloc] initWithNibName:@"RTMapViewController" bundle:nil];
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    
    packingListViewController.title = @"Packing List";
    activitiesListViewController.title = @"Activities";
    mapViewController.title = @"Map";
    
    UITabBarItem *packingListTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Packing List" image:[UIImage imageNamed:@"packinglisticon.png"] tag:1];
    UITabBarItem *activitiesTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Activities" image:[UIImage imageNamed:@"activitiesicon.png"] tag:2];
    UITabBarItem *mapTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"mapicon.png"] tag:3];
    
    
    packingListViewController.tabBarItem = packingListTabBarItem;
    activitiesListViewController.tabBarItem = activitiesTabBarItem;
    mapViewController.tabBarItem = mapTabBarItem;
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:packingListNavigationController, activitiesListNavigationController, mapNavigationController, nil];

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
