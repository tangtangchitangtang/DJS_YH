//
//  AppDelegate.m
//  yonghu
//
//  Created by 浪尖渝力 on 2018/1/12.
//  Copyright © 2018年 com.DJS. All rights reserved.
//

#import "AppDelegate.h"
#import "LogingViewController.h"
#import "HomeViewController.h"
#import "ConsultationViewController.h"
#import "CaseViewController.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    LogingViewController *yindao=[[LogingViewController alloc] init];
//    UINavigationController *nav1= [[UINavigationController alloc] initWithRootViewController:yindao];
//    self.window.rootViewController=nav1;
    
    HomeViewController *shouye=[[HomeViewController alloc] init];
    ConsultationViewController *huDong=[[ConsultationViewController alloc] init];
    CaseViewController *caseView=[[CaseViewController alloc] init];
    MyViewController *youJi=[[MyViewController alloc] init];
    
    
    
    UINavigationController *nav1= [[UINavigationController alloc] initWithRootViewController:shouye];
    UINavigationController *nav2= [[UINavigationController alloc] initWithRootViewController:huDong];
     UINavigationController *nav3= [[UINavigationController alloc] initWithRootViewController:caseView];
    UINavigationController *nav4= [[UINavigationController alloc] initWithRootViewController:youJi];
    
    nav1.title=@"首页";
    nav2.title=@"资讯";
    nav3.title=@"案件";
    nav4.title=@"我的";
    
    [nav1.tabBarItem setSelectedImage:[UIImage imageNamed:@"首页1"]];
    [nav1.tabBarItem setImage:[UIImage imageNamed:@"首页"]];
    
    [nav2.tabBarItem setSelectedImage:[UIImage imageNamed:@"资讯1"]];
    [nav2.tabBarItem setImage:[UIImage imageNamed:@"资讯"]];
    
    [nav3.tabBarItem setSelectedImage:[UIImage imageNamed:@"案件1"]];
    [nav3.tabBarItem setImage:[UIImage imageNamed:@"案件"]];
    
    [nav4.tabBarItem setSelectedImage:[UIImage imageNamed:@"我的1"]];
    [nav4.tabBarItem setImage:[UIImage imageNamed:@"我的"]];
    
    [[UITabBar appearance] setTintColor:_backgroundColor];
    
    UITabBarController *bar=[[UITabBarController alloc] init];
    bar.viewControllers=@[nav1,nav2,nav3,nav4];
    
    self.window.rootViewController=bar;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
