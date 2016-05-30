//
//  AppDelegate.m
//  Skp
//
//  Created by 剑锋 莫 on 16/3/11.
//  Copyright © 2016年 剑锋 莫. All rights reserved.
//

#import "AppDelegate.h"
#import "PKRevealController.h"
#import "LeftFaceController.h"
#import "CommonHeader.h"

#import "MainFaceController.h"
#import "ProductViewController.h"
#import "AboutViewController.h"
#import "ContractUsViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //菜单栏
    LeftFaceController* leftFaceController = [[LeftFaceController alloc] init];
    
    UITabBarController *tabBarController;
    tabBarController = [[UITabBarController alloc] init];
    tabBarController.delegate=self;
    tabBarController.moreNavigationController.navigationBar.barStyle=UIBarStyleBlack;

    //Home界面
    MainFaceController* mainFaceController = [[MainFaceController alloc] init];
    //Product界面
    ProductViewController *productVC = [[ProductViewController alloc]init];
    //About 界面
    AboutViewController *aboutVC = [[AboutViewController alloc]init];
    //Contract US
    ContractUsViewController *contractVC = [[ContractUsViewController alloc]init];

    UINavigationController *navHome = [[UINavigationController alloc] initWithRootViewController:mainFaceController];
    UINavigationController *navProduct = [[UINavigationController alloc] initWithRootViewController:productVC];
    UINavigationController *navAbout = [[UINavigationController alloc] initWithRootViewController:aboutVC];
    UINavigationController *navContract = [[UINavigationController alloc] initWithRootViewController:contractVC];
    
    
    tabBarController.viewControllers = [NSArray arrayWithObjects:navHome,navProduct,navAbout, navContract,nil];
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *itemBar0= [tabBar.items objectAtIndex:0];
    itemBar0.image = [UIImage imageNamed:@"me"];
    itemBar0.title = @"Home";
    UITabBarItem *itemBar1= [tabBar.items objectAtIndex:1];
    itemBar1.image = [UIImage imageNamed:@"me"];
    itemBar1.title = @"Product";
    UITabBarItem *itemBar2= [tabBar.items objectAtIndex:2];
    itemBar2.image = [UIImage imageNamed:@"me"];
    itemBar2.title = @"About Us";
    UITabBarItem *itemBar3= [tabBar.items objectAtIndex:3];
    itemBar3.image = [UIImage imageNamed:@"me"];
    itemBar3.title = @"Contract Us";
    
    
    
     //构造PKRevealController对象
    self.revealController = [PKRevealController revealControllerWithFrontViewController:tabBarController leftViewController:leftFaceController options:nil];
    //
    //对导航栏定制 start
    [[UINavigationBar appearance] setBarTintColor:APPFRAME_COLOR];//UIColorFromRGB(0x067AB5)];
    //[UINavigationBar appearance].translucent  = YES;
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
   // [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //对导航栏定制 end
    //对tab栏定制 start
    [[UITabBar appearance] setBackgroundImage: [UIImage imageWithColor:APPFRAME_COLOR]];
    //隐藏那条黑线
    [[UITabBar appearance] setShadowImage:[UIImage imageWithColor:APPFRAME_COLOR]];
    [[UITabBar appearance] setTintColor:TINT_COLOR];//UIColorFromRGB(0x067AB5)];
    
//    UITabBarController *tabbarVc = (UITabBarController *)self.window.rootViewController;
//    tabbarVc.delegate = self;
    //
   
    //将其PKRevealController对象作为RootViewController
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = self.revealController;
    [self.window makeKeyAndVisible];
    return YES;
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
