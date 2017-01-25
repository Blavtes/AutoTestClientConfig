//
//  SwipeActionView.m
//  AutoTestClient
//
//  Created by yangyong on 2017/1/24.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import "EventActionView.h"
#import "EventActionModel.h"

@implementation EventActionView

- (instancetype)initWithCoder:(NSCoder*)coder
{
    NSString* nibName = NSStringFromClass([self class]);
    self = [super initWithCoder:coder];
    if (self) {
        if ([[NSBundle mainBundle] loadNibNamed:nibName
                                          owner:self
                                topLevelObjects:nil]) {
            [self.view setFrame:[self bounds]];
            [self addSubview:self.view];
        }
    }
    return self;
}

- (IBAction)clearnEventClick:(id)sender {
    _swipeBt.state = 0;
    _pointAX.stringValue = @"";
    _pointAY.stringValue = @"";
    _pointBX.stringValue = @"";
    _pointBY.stringValue = @"";
    
    _pathClickBt.state = 0;
    _pathClickText.stringValue = @"";
    
    _IDClickBt.state = 0;
    _IDClickText.stringValue = @"";
    
    _pathKeyBt.state = 0;
    _pathKeyText.stringValue = @"";
    _pathKeySendText.stringValue = @"";
    
    _IDKeyBt.state = 0;
    _IDKeyText.stringValue = @"";
    _IDKeySendText.stringValue = @"";
    
}

- (IBAction)addEventClick:(id)sender {
    
    EventActionModel *model = [[EventActionModel alloc] init];
    if (_swipeBt.state == 1) {
        model.swipeModel.swipeBtState = YES;
        model.swipeModel.aX = _pointAX.stringValue;
        model.swipeModel.aY = _pointAY.stringValue;
        model.swipeModel.bX = _pointBX.stringValue;
        model.swipeModel.bY = _pointBY.stringValue;
        model.eventType = EventSwipType;
    }
    
    if (_pathClickBt.state == 1) {
        model.pathClickModel.pathClickBtState = YES;
        model.pathClickModel.pathClickText = _pathClickText.stringValue;
        model.eventType = EventPathClickType;
    }
    
    if (_IDClickBt.state == 1) {
        model.IDClickModel.IDClickBtState = YES;
        model.IDClickModel.IDClickText = _IDClickText.stringValue;
        model.eventType = EventIdClickType;
    }
    
    if (_pathKeyBt.state == 1) {
        model.pathKeyModel.pathKeyBtState = YES;
        model.pathKeyModel.pathKeyText = _pathKeyText.stringValue;
        
        model.pathKeyModel.pathKeySendText = _pathKeySendText.stringValue;
        model.eventType = EventPathKeyType;
    }
    
    if (_IDKeyBt.state == 1) {
        model.IDKeyModel.IDKeyBtState = YES;
        model.IDKeyModel.IDKeyText = _IDKeyText.stringValue;
        model.IDKeyModel.IDKeySendText = _IDKeySendText.stringValue;
        model.eventType = EventIDKeyType;
    }
    
    switch (model.eventType) {
        case EventSwipType:
            model.messageTitle = @"滑动";
            break;
        case EventPathClickType:
            model.messageTitle = @"路径点击";
            break;
        case EventPathKeyType:
            model.messageTitle = @"路径键值";
            break;
        case EventIdClickType:
            model.messageTitle = @"id点击";
            break;
        case EventIDKeyType:
            model.messageTitle = @"id键值";
            break;
        default:
            break;
    }
    
    if (self.sendEventActionBlock) {
        self.sendEventActionBlock(model);
    }
}



- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    self.layer.borderWidth = 1;
    self.layer.borderColor = [NSColor whiteColor].CGColor;
    // Drawing code here.
}

@end
