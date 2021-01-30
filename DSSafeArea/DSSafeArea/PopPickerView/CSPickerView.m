//
//  CSPickerView.m
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

#import "CSPickerView.h"


@implementation CSPickerSetting

-(instancetype)init {
    self = [super init];
    if (self) {
        _pickerViewHeight = 296;
        _selectRow = 0;
    }
    return self;
}

@end



@interface CSPickerView ()

@property (nonatomic, strong) UIView *toolView;
@property (nonatomic, strong) UIView *sepLineView;  //分割线
@property (nonatomic, strong) UIButton *cancelBtn;  //取消
@property (nonatomic, strong) UILabel *titleLabel;  //标题
@property (nonatomic, strong) UIButton *doneBtn;    //确定

@end

@implementation CSPickerView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
        self.contentView.backgroundColor = UIColor.whiteColor;
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews {
    [self.contentView addSubview:self.toolView];
    [self.toolView addSubview:self.titleLabel];
    [self.toolView addSubview:self.cancelBtn];
    [self.toolView addSubview:self.doneBtn];
    [self.toolView addSubview:self.sepLineView];
    
    [self.contentView addSubview:self.picker];
}

- (void)setupConstraints {
    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(20);
        make.bottom.mas_equalTo(-10);
        make.width.mas_lessThanOrEqualTo(80);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.cancelBtn);
        make.left.mas_equalTo(self.cancelBtn.mas_right);
        make.right.mas_equalTo(self.doneBtn.mas_left);
    }];
    [self.doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.cancelBtn);
        make.right.mas_equalTo(-20);
        make.width.mas_lessThanOrEqualTo(80);
    }];
    [self.sepLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.toolView.mas_bottom).offset(-1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    [self.picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.toolView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

-(UIView *)toolView {
    if (!_toolView) {
        _toolView = [UIView new];
    }
    return _toolView;
}

-(UIView *)sepLineView {
    if (!_sepLineView) {
        _sepLineView = [UIView new];
        _sepLineView.backgroundColor = HexColor(0xE6E6E6, 1);
    }
    return _sepLineView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = HexColor(0x323232, 1);
        _titleLabel.font = PFMediumFont(16);
    }
    return _titleLabel;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:HexColor(0x646464, 1) forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = PFRegularFont(16);
    }
    return _cancelBtn;
}

-(UIButton *)doneBtn {
    if (!_doneBtn) {
        _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_doneBtn addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
        [_doneBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_doneBtn setTitleColor:HexColor(0xF51616, 1) forState:UIControlStateNormal];
        _doneBtn.titleLabel.font = PFRegularFont(16);
    }
    return _doneBtn;
}

-(UIPickerView *)picker {
    if (!_picker) {
        _picker = [[UIPickerView alloc] init];
    }
    return _picker;
}

#pragma mark - interface
-(void)setPickerSetting:(CSPickerSetting *)pickerSetting {
    _pickerSetting = pickerSetting;
    if (pickerSetting.selectRow > 0) {
        [self.picker selectRow:pickerSetting.selectRow inComponent:0 animated:NO];
    }
    if (pickerSetting.leftTitle) {
        [self.cancelBtn setTitle:pickerSetting.leftTitle forState:UIControlStateNormal];
    }
    if (pickerSetting.leftColor) {
        [self.cancelBtn setTitleColor:pickerSetting.leftColor forState:UIControlStateNormal];
    }
    if (pickerSetting.title) {
        self.titleLabel.text = pickerSetting.title;
    }
    if (pickerSetting.titleColor) {
        self.titleLabel.textColor = pickerSetting.titleColor;
    }
    if (pickerSetting.rightTitle) {
        [self.doneBtn setTitle:pickerSetting.rightTitle forState:UIControlStateNormal];
    }
    if (pickerSetting.rightColor) {
        [self.doneBtn setTitleColor:pickerSetting.rightColor forState:UIControlStateNormal];
    }
}


#pragma mark - action

- (void)cancelAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(clickCancelBtn:)]) {
        [self.delegate clickCancelBtn:btn];
    }
}

- (void)doneAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(clickDoneBtn:)]) {
        [self.delegate clickDoneBtn:btn];
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
