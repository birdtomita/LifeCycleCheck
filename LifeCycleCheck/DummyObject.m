//
//  DummyObject.m
//  LifeCycleCheck
//
//  Created by 富田篤 on 2020/05/29.
//  Copyright © 2020 Bird Tomita. All rights reserved.
//

#import "DummyObject.h"
#import "DummySingleton.h"
@import UIKit;

@implementation DummyObject

- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
        // Do any additional setup after loading the view.
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center addObserver:self
                   selector:@selector(applicationDidBecomeActiveNotification:)
                       name:UIApplicationDidBecomeActiveNotification
                     object:nil];
    }
    return self;
}

- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification
{
    NSLog(@"iOS %.1f %s start thread START %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    sleep(3);
    [[DummySingleton sharedManager] setSingletonArray:@[@"a",@"b",@"c"]];
    NSLog(@"dummyArray = %@",DummySingleton.sharedManager.singletonArray);
    NSLog(@"iOS %.1f %s end thread END %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

@end
