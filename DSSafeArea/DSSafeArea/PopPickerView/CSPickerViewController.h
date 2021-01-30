//
//  CSPickerViewController.h
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

//    NSArray *dataArray = @[];
//    CSPickerViewController *vc = [CSPickerViewController new];
//    vc.selectDoneBlock = ^(NSInteger index) {
//        NSLog(@"----%@", dataArray[index]);
//    };
//    vc.dataArray = dataArray;
//    [vc show];

//        HTPickerSetting *setting = [HTPickerSetting new];
//        setting.pickerViewHeight = 300;
//        setting.selectRow = 1;
//        setting.leftTitle = @"cancel";
//        setting.leftColor = RandomColor;
//        setting.title = @"标题";
//        setting.titleColor = RandomColor;
//        setting.rightTitle = @"done";
//        setting.rightColor = RandomColor;
//        [vc showWithSetting:setting];

#import <UIKit/UIKit.h>
#import "CSPickerView.h"

/// 选择器展示
@interface CSPickerViewController : UIViewController

@property (nonatomic, strong) NSArray<NSString *> *dataArray;   //  数据源

@property (nonatomic, copy) void(^selectDoneBlock)(NSInteger);  //  选择完成索引

/// 展示
- (void)show;

/// 设置配置 展示
/// @param settting 配置信息
- (void)showWithSetting:(CSPickerSetting *)settting;

@end


