//
//  EventActionModel.h
//  AutoTestClient
//
//  Created by yangyong on 2017/1/25.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EventSwipeModel;
@class EventPathClickModel;
@class EventIDClickModel;
@class EventPathKeyModel;
@class EventIDKeyModel;

typedef enum : NSUInteger {
    EventSwipType,
    EventPathClickType,
    EventPathKeyType,
    EventIdClickType,
    EventIDKeyType
    
} EventActionType;

@interface EventActionModel : NSObject
@property (nonatomic, strong) EventSwipeModel *swipeModel;

@property (nonatomic, strong) EventPathClickModel *pathClickModel;

@property (nonatomic, strong) EventIDClickModel *IDClickModel;

@property (nonatomic, strong) EventPathKeyModel *pathKeyModel;

@property (nonatomic, strong) EventIDKeyModel *IDKeyModel;
@property (nonatomic, strong) NSString *messageTitle;
@property (nonatomic, assign) EventActionType eventType;

@end

@interface EventSwipeModel : NSObject
@property (nonatomic, assign) BOOL swipeBtState;
@property (nonatomic, strong) NSString *aX;
@property (nonatomic, strong) NSString *aY;
@property (nonatomic, strong) NSString *bX;
@property (nonatomic, strong) NSString *bY;
@end

@interface EventPathClickModel : NSObject
@property (nonatomic, assign) BOOL pathClickBtState;
@property (nonatomic, strong) NSString *pathClickText;
@end

@interface EventIDClickModel : NSObject
@property (nonatomic, assign) BOOL IDClickBtState;

@property (nonatomic, strong) NSString *IDClickText;

@end

@interface EventPathKeyModel : NSObject

@property (nonatomic, assign) BOOL pathKeyBtState;
@property (nonatomic, strong) NSString *pathKeyText;
@property (nonatomic, strong) NSString *pathKeySendText;

@end

@interface EventIDKeyModel : NSObject

@property (nonatomic, assign) BOOL IDKeyBtState;

@property (nonatomic, strong) NSString *IDKeyText;
@property (nonatomic, strong) NSString *IDKeySendText;
@end
