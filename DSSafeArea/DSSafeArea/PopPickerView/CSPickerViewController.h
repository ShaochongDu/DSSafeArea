//
//  CSPickerViewController.h
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

//    NSArray *dataArray = @[];
//    CSPopPickerSetting *setting = [CSPopPickerSetting new];
//    setting.pickerViewHeight = 300;
//    setting.selectRow = 1;
//    CSToolBarSetting *barSetting = [CSToolBarSetting new];
//    barSetting.leftTitle = @"cancel";
//    barSetting.leftColor = RandomColor;
//    barSetting.title = @"标题";
//    barSetting.titleColor = RandomColor;
//    barSetting.rightTitle = @"done";
//    barSetting.rightColor = RandomColor;
//    setting.barSetting = barSetting;
//    [popVC showWithSetting:setting];

#import "CSToolView.h"

@interface CSPopPickerSetting : NSObject

@property (nonatomic, assign) CGFloat pickerViewHeight;// 高度：默认296

@property (nonatomic, assign) NSInteger selectRow;  //  默认选中

@property (nonatomic, strong) CSToolBarSetting *barSetting;

@end

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
- (void)showWithSetting:(CSPopPickerSetting *)settting;

@end


