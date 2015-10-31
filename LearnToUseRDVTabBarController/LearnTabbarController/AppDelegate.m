//
//  AppDelegate.m
//  LearnTabbarController
//
//  Created by zhou on 15/10/31.
//  Copyright © 2015年 jeff.zhou. All rights reserved.
//

#import "AppDelegate.h"
#import "RDVTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "RDVTabBarItem.h"
#import <RKSwipeBetweenViewControllers/RKSwipeBetweenViewControllers.h>




@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RDVTabBarController *tabBarController = (RDVTabBarController *)[storyboard instantiateInitialViewController];
    
    
    // FirstViewController
    FirstViewController *firstViewController = [[FirstViewController alloc] init];
    firstViewController.title = @"First";
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:firstViewController];
    
    
    // SecondViewController
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    secondViewController.title = @"Second";
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:secondViewController];
    
    
    // ThirdViewController
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    thirdViewController.title = @"Third";
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:thirdViewController];
    
    tabBarController.viewControllers = @[navigationController1, navigationController2, navigationController3];
    [self customViewController:tabBarController];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)customViewController:(RDVTabBarController *)tabBarController{

    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"first", @"second", @"third"];
    NSArray *tabBarItemTitles = @[@"first", @"second", @"third"];
    
    RDVTabBar *tabBar = [tabBarController tabBar];
    
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 63)];
    
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarController tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_normal",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        
        [item setTitle:tabBarItemTitles[index]];

        
        index++;
    }



}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
