//
//  CSPickerView.h
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

#import "BaseBottomView.h"
@class CSPopPickerSetting;

@protocol CSPickerViewProtocol <NSObject>

- (void)pickerToolViewCancel:(UIButton *)btn;
- (void)pickerToolViewDone:(UIButton *)btn;

@end



@interface CSPickerView : BaseBottomView

@property (nonatomic, weak) id<CSPickerViewProtocol> delegate;

@property (nonatomic, strong) UIPickerView *picker;

@property (nonatomic, strong) CSPopPickerSetting *pickerSetting;

@end


