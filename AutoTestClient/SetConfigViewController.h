//
//  SetConfig.h
//  AutoTestClient
//
//  Created by yangyong on 2017/1/23.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SettingModel.h"

typedef  void (^SaveBlock)(SettingModel *);

@interface SetConfigViewController : NSViewController
@property (nonatomic, strong) SaveBlock saveBlock;
@end
