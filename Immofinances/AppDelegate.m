//
//  AppDelegate.m
//  Immofinances
//
//  Created by Aminowizc on 06/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self scaleSizeOfBigIphones];
    
    return YES;
}

- (void)scaleSizeOfBigIphones {
    NSLog(@"width %f", [UIScreen mainScreen].bounds.size.width);
    if ([UIScreen mainScreen].bounds.size.width == 414.00){
        NSLog(@"iPhone 6 Plus");
        float startX = (414.00 / 2) - (375.00/2);
        
        float startY = (736.00 / 2) - (667.00/2);
        
        self.window.frame = CGRectMake(startX, startY, 375.00, 667.00);
        
        self.window.transform = CGAffineTransformMakeScale(1.104,1.103448);
    }
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
