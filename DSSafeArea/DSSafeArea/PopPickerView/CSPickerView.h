//
//  CSPickerView.h
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

#import "BaseBottomView.h"

@interface CSPickerSetting : NSObject

@property (nonatomic, assign) CGFloat pickerViewHeight;// 高度：默认296

@property (nonatomic, assign) NSInteger selectRow;  //  默认选中

@property (nonatomic, copy) NSString *leftTitle; // 左侧标题
@property (nonatomic, strong) UIColor *leftColor;

@property (nonatomic, copy) NSString *title;    //  标题
@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, copy) NSString *rightTitle;   // 右侧标题
@property (nonatomic, strong) UIColor *rightColor;

@end


@protocol CSPickerViewProtocol <NSObject>

- (void)clickCancelBtn:(UIButton *)btn;
- (void)clickDoneBtn:(UIButton *)btn;

@end



@interface CSPickerView : BaseBottomView

@property (nonatomic, weak) id<CSPickerViewProtocol> delegate;

@property (nonatomic, strong) UIPickerView *picker;

@property (nonatomic, strong) CSPickerSetting *pickerSetting;

@end


