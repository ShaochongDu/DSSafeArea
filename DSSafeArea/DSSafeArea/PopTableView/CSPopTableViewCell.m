//
//  CSPopTableViewCell.m
//  DSSafeArea
//
//  Created by 杜 on 2021/2/2.
//

#import "CSPopTableViewCell.h"

@interface CSPopTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;  //  标题
@property (nonatomic, strong) UIView *lineView; // 分割线

@end

@implementation CSPopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupViews];
        [self setupConstraints];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - 视图及约束

- (void)setupViews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.lineView];
//    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setupConstraints {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(15);
        make.left.mas_offset(20);
        make.bottom.mas_offset(-15);
        make.right.mas_offset(-20);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(1);
        make.bottom.mas_equalTo(self.contentView);
    }];
}

- (UILabel *)titleLabel {
    return _titleLabel ? : (_titleLabel = ({
        UILabel *label = [UILabel new];
        label.font = PFRegularFont(16);
        label.textColor = HexColor(0x353535, 1);
        label;
    }));
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = HexColor(0xF0F0F0ff, 1);
    }
    return _lineView;
}

#pragma mark - datasource
-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}


@end
