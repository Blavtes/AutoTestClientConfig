//
//  SettingModel.h
//  AutoTestClient
//
//  Created by yangyong on 2017/1/23.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModel : NSObject
@property (nonatomic, strong) NSString *platformName;
@property (nonatomic, strong) NSString *platformVersion;
@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *appiumVersion;
@end
