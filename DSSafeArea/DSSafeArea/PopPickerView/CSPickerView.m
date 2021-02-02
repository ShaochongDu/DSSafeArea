//
//  CSPickerView.m
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

#import "CSPickerView.h"
#import "CSPickerViewController.h"
#import "CSToolView.h"

@interface CSPickerView ()

@property (nonatomic, strong) CSToolView *toolView;

@end

@implementation CSPickerView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //  控制整体背景，防止圆角无法显示
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
        self.contentView.backgroundColor = UIColor.whiteColor;
        //  控制底部填充视图颜色，防止颜色不统一
        self.maskBottomViewColor = UIColor.whiteColor;
        
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.toolView];
    [self.contentView addSubview:self.picker];
    
    __weak typeof(self) weakSelf = self;
    self.toolView.cancelBlock = ^(UIButton * btn) {
        [weakSelf cancelAction:btn];
    };
    self.toolView.doneBlock = ^(UIButton * btn) {
        [weakSelf doneAction:btn];
    };
}

- (void)setupConstraints {
    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.toolView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

-(CSToolView *)toolView {
    if (!_toolView) {
        _toolView = [CSToolView new];
    }
    return _toolView;
}

-(UIPickerView *)picker {
    if (!_picker) {
        _picker = [[UIPickerView alloc] init];
    }
    return _picker;
}

#pragma mark - interface
-(void)setPickerSetting:(CSPopPickerSetting *)pickerSetting {
    _pickerSetting = pickerSetting;
    if (pickerSetting.selectRow > 0) {
        [self.picker selectRow:pickerSetting.selectRow inComponent:0 animated:NO];
    }
    self.toolView.toolBarSetting = pickerSetting.barSetting;
}


#pragma mark - action

- (void)cancelAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(pickerToolViewCancel:)]) {
        [self.delegate pickerToolViewCancel:btn];
    }
}

- (void)doneAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(pickerToolViewDone:)]) {
        [self.delegate pickerToolViewDone:btn];
    }
}

//-(void)layoutSubviews {
//    [super layoutSubviews];
//    
//    
//    self.contentView.layer.masksToBounds = YES;
//    self.contentView.layer.cornerRadius = 10;
//    
//    self.contentView.backgroundColor = RandomColor;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
