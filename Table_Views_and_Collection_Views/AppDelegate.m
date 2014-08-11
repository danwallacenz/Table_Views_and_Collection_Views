//
//  AppDelegate.m
//  Table_Views_and_Collection_Views
//
//  Created by Daniel Wallace on 10/08/14.
//  Copyright (c) 2014 nz.co.danielw. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "CustomCellTableViewController.h"
#import "CellSubviewsInCodeTVC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UITabBarController *uiTabBarController = [UITabBarController new];
    
    self.window.rootViewController = uiTabBarController;
    
    RootViewController *rootViewController = [RootViewController new];
    rootViewController.title = @"Cell Properties";
    CustomCellTableViewController *customCellTableViewController = [CustomCellTableViewController new];
    customCellTableViewController.title = @"layoutSubviews";
    CellSubviewsInCodeTVC *cellSubviewsInCodeTVC = [CellSubviewsInCodeTVC new];
    cellSubviewsInCodeTVC.title = @"Subviews In Code";
    
    [uiTabBarController setViewControllers:@[cellSubviewsInCodeTVC, customCellTableViewController, rootViewController] animated: YES];

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
