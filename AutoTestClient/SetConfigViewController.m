//
//  SetConfig.m
//  AutoTestClient
//
//  Created by yangyong on 2017/1/23.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import "SetConfigViewController.h"
#import "SettingModel.h"

@interface SetConfigViewController () <NSPathControlDelegate>
@property (weak) IBOutlet NSTextField *pathTextField;

@property (weak) IBOutlet NSTextField *platformVersionTextField;

@property (weak) IBOutlet NSTextField *appiumVersionTextField;

@property (weak) IBOutlet NSButton *appiumSelect;
@property (weak) IBOutlet NSTextField *appiumVTextField;

@property (weak) IBOutlet NSTextField *deviceNameTextField;


@property (nonatomic, strong) SettingModel *model;
@end

@implementation SetConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    _model = [[SettingModel alloc] init];
}

- (void)handleSelect:(void(^)(NSURL *url))onComplete{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setCanChooseFiles: YES]; //是否能选择文件
    [panel setCanCreateDirectories: NO]; // 是否创建文件夹
    [panel setCanChooseDirectories: NO]; // 是否能选择文件夹
    [panel setAllowedFileTypes:@[@"apk",@"ipa",@"app"]];
    [panel beginSheetModalForWindow: [[self view] window] completionHandler: ^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton) {
            onComplete([panel URLs][0]);
        }
    }];
}

- (IBAction)pathClick:(id)sender {
    NSLog(@"normollClick");
    [self handleSelect:^(NSURL *url) {
//        [self.normollPath setURL:url];
        NSString *path = url.absoluteString;
        NSArray *arr = [path componentsSeparatedByString:@"//"];
        
        [_pathTextField setStringValue:arr.lastObject];
        
    }];
}

- (void)setDraggingSourceOperationMask:(NSDragOperation)mask
                              forLocal:(BOOL)isLocal
{
    NSLog(@"isLocal %d",isLocal);
}

- (void)pathControl:(NSPathControl *)pathControl willDisplayOpenPanel:(NSOpenPanel *)openPanel
{
    NSLog(@"openPanel %d",openPanel);
    [openPanel setDelegate:self];
    [openPanel setCanChooseDirectories:YES];
    [openPanel setCanCreateDirectories:YES];
    [openPanel setCanChooseFiles:NO];
    [openPanel setPrompt:@"Choose"];
}

- (IBAction)saveClick:(id)sender
{
    _model.platformName = _platformVersionTextField.stringValue;
    _model.deviceName  = _deviceNameTextField.stringValue;
    if (_appiumSelect.state == 1) {
        _model.appiumVersion = _appiumVTextField.stringValue;
    }
    _model.path = _pathTextField.stringValue;
    NSLog(@"model des %@",_model.description);
    if (_saveBlock) {
        self.saveBlock(_model);
    }
}



@end
