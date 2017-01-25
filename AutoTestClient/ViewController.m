//
//  ViewController.m
//  AutoTestClient
//
//  Created by yangyong on 2017/1/23.
//  Copyright © 2017年 yangyong. All rights reserved.
//

#import "ViewController.h"
#import "SetConfigViewController.h"
#import "SettingModel.h"
#import "EventActionView.h"
#import "EventActionModel.h"

@interface ViewController () <NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSButton *iOSCheckout;
@property (weak) IBOutlet NSButton *androidCheckout;

@property (weak) IBOutlet EventActionView *eventView;

@property (weak) IBOutlet NSTableView *tableView;


@property (nonatomic, strong) SettingModel *setModel;

@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ViewController

- (IBAction)iOSCheckout:(id)sender {
    _androidCheckout.state = 0;
}

- (IBAction)androidCheckout:(id)sender {
    _iOSCheckout.state = 0;
}

- (IBAction)settingClick:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    
    NSStoryboard * sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    SetConfigViewController * lvc = [sb instantiateControllerWithIdentifier:@"SetConfigViewController"];
    lvc.saveBlock = ^(SettingModel *model ){
        NSLog(@"model %@",model);
        weakSelf.setModel = model;
    };
   [self presentViewControllerAsModalWindow:lvc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _dataArr = [NSMutableArray arrayWithCapacity:1];
    _eventView.sendEventActionBlock = ^(EventActionModel *model) {
        NSLog(@"mode.%@",model);
        [_dataArr addObject:model];
        [_tableView reloadData];
    };
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return _dataArr.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *result = [self.tableView makeViewWithIdentifier:@"MyView" owner:self];
    
    EventActionModel *model = [self.dataArr objectAtIndex:row];
    if ([tableColumn.identifier isEqualToString:@"Action"]) {
        result.textField.stringValue = model.messageTitle;
    } else if ([tableColumn.identifier isEqualToString:@"Value"]) {
        result.textField.stringValue = model.messageTitle;
    }
    
    return result;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
