//
//  ViewController.m
//  LifeCycleCheck
//
//  Created by 富田篤 on 2020/05/29.
//  Copyright © 2020 Bird Tomita. All rights reserved.
//

#import "ViewController.h"
#import "DummyObject.h"
#import "DummySingleton.h"

@interface ViewController (){
    DummyObject *_dummyObject;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    // Do any additional setup after loading the view.
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(applicationDidBecomeActiveNotification:)
                   name:UIApplicationDidBecomeActiveNotification
                 object:nil];
    [center addObserver:self
               selector:@selector(applicationDidEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
    [center addObserver:self selector:@selector(applicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];

    _dummyObject = [DummyObject new];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    [super viewDidAppear:animated];
    NSLog(@"SBname = %@",[NSUserDefaults.standardUserDefaults stringForKey:@"name_preference"]);
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    [super viewDidDisappear:animated];
}

- (void)applicationDidBecomeActiveNotification:(NSNotification *)notification
{
    NSLog(@"iOS %.1f %s start thread START %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
    sleep(3);
    [[DummySingleton sharedManager] setSingletonArray:@[@"a",@"b",@"c"]];
    NSLog(@"dummyArray = %@",DummySingleton.sharedManager.singletonArray);
    NSLog(@"iOS %.1f %s end thread END %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (void)applicationDidEnterBackgroundNotification:(NSNotification *)notification {
    NSLog(@"iOS %.1f %s end thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (void)applicationWillResignActiveNotification:(NSNotification *)notification {
    NSLog(@"iOS %.1f %s end thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

@end
