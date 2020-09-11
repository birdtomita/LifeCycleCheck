//
//  DummySingleton.h
//  LifeCycleCheck
//
//  Created by 富田篤 on 2020/05/29.
//  Copyright © 2020 Bird Tomita. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DummySingleton : NSObject

@property (nonatomic) NSArray *singletonArray;
+ (DummySingleton *)sharedManager;

@end

NS_ASSUME_NONNULL_END
