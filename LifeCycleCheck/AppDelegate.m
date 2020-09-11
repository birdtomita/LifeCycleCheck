//
//  AppDelegate.m
//  LifeCycleCheck
//
//  Created by 富田篤 on 2020/05/29.
//  Copyright © 2020 Bird Tomita. All rights reserved.
//

#import "AppDelegate.h"
#import "DummyObject.h"

@interface AppDelegate (){
    DummyObject *_dummyObject;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    // if iOS14
    // do some check
    _dummyObject = [DummyObject new];
    [NSUserDefaults.standardUserDefaults setBool:NO forKey:@"enabled_preference"];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"iOS %.1f %s start thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    NSLog(@"iOS %.1f %s end thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}


@end
