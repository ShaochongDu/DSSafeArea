//
//  CSPopTableHeaderView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/2/2.
//

#import "CSPopTableHeaderView.h"

@interface CSPopTableHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel; //  标题
@property (nonatomic, strong) UIButton *closeBtn;  //  指示器

@end

@implementation CSPopTableHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - 视图及约束

- (void)setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.closeBtn];
    
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setupConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(self.closeBtn.mas_left).offset(-10);
        make.centerY.mas_equalTo(self.contentView);
    }];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(18);
        make.centerY.mas_equalTo(self.contentView);
        make.right.mas_equalTo(self.contentView).offset(-20);
    }];
}

- (UILabel *)titleLabel {
    return _titleLabel ? : (_titleLabel = ({
        UILabel *label = [UILabel new];
        label.font = PFMediumFont(16);
        label.textColor = HexColor(0x262626, 1);
        label.numberOfLines = 1;
//        label.backgroundColor = RandomColor;
        label;
    }));
}

-(UIButton *)closeBtn {
    return _closeBtn ? : (_closeBtn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"area_list_close"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        btn;
    }));
}

#pragma mark - datasource

-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}


#pragma mark - action

- (void)closeAction:(UIButton *)btn {
    if (self.closeBlock) {
        self.closeBlock();
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
