//
//  DummySingleton.m
//  LifeCycleCheck
//
//  Created by 富田篤 on 2020/05/29.
//  Copyright © 2020 Bird Tomita. All rights reserved.
//

#import "DummySingleton.h"
@import UIKit;

@interface DummySingleton(){
    NSArray* _singletonArray;
}

@end

@implementation DummySingleton
static DummySingleton *sharedData_ = nil;

+ (DummySingleton *)sharedManager{
    @synchronized(self){
        if (!sharedData_) {
            sharedData_ = [DummySingleton new];
        }
    }
    return sharedData_;
}


- (id)init
{
    self = [super init];
    if (self) {
        //Initialization
    }
    return self;
}

//demoMethod
- (void)setSingletonArray:(NSArray *)singletonArray{
    _singletonArray = singletonArray;
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

- (NSArray *)singletonArray {
    return _singletonArray;
    NSLog(@"iOS %.1f %s thread %@",[UIDevice currentDevice].systemVersion.floatValue,__PRETTY_FUNCTION__,[NSThread currentThread]);
}

@end
