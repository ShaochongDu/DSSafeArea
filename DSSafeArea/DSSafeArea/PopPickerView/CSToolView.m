//
//  CSToolView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/2/2.
//

#import "CSToolView.h"

@implementation CSToolBarSetting

-(instancetype)init {
    self = [super init];
    if (self) {
        _leftTitle = @"取消";
        _rightTitle = @"完成";
    }
    return self;
}

@end

@interface CSToolView ()

@property (nonatomic, strong) UIView *sepLineView;  //分割线

@end

@implementation CSToolView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)setupViews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.cancelBtn];
    [self addSubview:self.doneBtn];
    [self addSubview:self.sepLineView];
}

- (void)setupConstraints {
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
        make.bottom.mas_equalTo(self.mas_bottom).offset(-1);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
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

#pragma mark - interface

-(void)setToolBarSetting:(CSToolBarSetting *)toolBarSetting {
    _toolBarSetting = toolBarSetting;
    
    if (toolBarSetting.leftTitle) {
        [self.cancelBtn setTitle:toolBarSetting.leftTitle forState:UIControlStateNormal];
    }
    if (toolBarSetting.leftColor) {
        [self.cancelBtn setTitleColor:toolBarSetting.leftColor forState:UIControlStateNormal];
    }
    if (toolBarSetting.title) {
        self.titleLabel.text = toolBarSetting.title;
    }
    if (toolBarSetting.titleColor) {
        self.titleLabel.textColor = toolBarSetting.titleColor;
    }
    if (toolBarSetting.rightTitle) {
        [self.doneBtn setTitle:toolBarSetting.rightTitle forState:UIControlStateNormal];
    }
    if (toolBarSetting.rightColor) {
        [self.doneBtn setTitleColor:toolBarSetting.rightColor forState:UIControlStateNormal];
    }
}


#pragma mark - action

- (void)cancelAction:(UIButton *)btn {
    if (self.cancelBlock) {
        self.cancelBlock(btn);
    }
}

- (void)doneAction:(UIButton *)btn {
    if (self.doneBlock) {
        self.doneBlock(btn);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
