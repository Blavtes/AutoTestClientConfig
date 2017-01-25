//
//  EventActionModel.m
//  AutoTestClient
//
//  Created by yangyong on 2017/1/25.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import "EventActionModel.h"

@implementation EventActionModel
-(instancetype)init
{
    if (self = [super init]) {
        _swipeModel = [[EventSwipeModel alloc] init];
        _pathClickModel = [[EventPathClickModel alloc] init];
        _pathKeyModel = [[EventPathKeyModel alloc] init];
        
        _IDKeyModel = [[EventIDKeyModel alloc] init];
        _IDClickModel = [[EventIDClickModel alloc] init];
    }
    return self;
}
@end

@implementation EventSwipeModel


@end

@implementation EventPathClickModel


@end

@implementation EventPathKeyModel


@end

@implementation EventIDKeyModel


@end

@implementation EventIDClickModel


@end

