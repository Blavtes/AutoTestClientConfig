//
//  SwipeActionView.h
//  AutoTestClient
//
//  Created by yangyong on 2017/1/24.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "EventActionModel.h"
typedef  void (^SendEventActionBlock)(EventActionModel *);


@interface EventActionView : NSView
@property (weak) IBOutlet NSView *view;

@property (weak) IBOutlet NSButton *swipeBt;
@property (weak) IBOutlet NSTextField *pointAX;
@property (weak) IBOutlet NSTextField *pointAY;
@property (weak) IBOutlet NSTextField *pointBX;
@property (weak) IBOutlet NSTextField *pointBY;

@property (weak) IBOutlet NSButton *pathClickBt;
@property (weak) IBOutlet NSTextField *pathClickText;

@property (weak) IBOutlet NSButton *IDClickBt;
@property (weak) IBOutlet NSTextField *IDClickText;

@property (weak) IBOutlet NSButton *pathKeyBt;
@property (weak) IBOutlet NSTextField *pathKeyText;
@property (weak) IBOutlet NSTextField *pathKeySendText;

@property (weak) IBOutlet NSButton *IDKeyBt;
@property (weak) IBOutlet NSTextField *IDKeyText;
@property (weak) IBOutlet NSTextField *IDKeySendText;

@property (nonatomic, strong) SendEventActionBlock sendEventActionBlock;

- (instancetype)initWithCoder:(NSCoder*)coder;

@end
