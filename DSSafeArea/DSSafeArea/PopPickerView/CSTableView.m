//
//  CSTableView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import "CSTableView.h"

@interface CSTableView ()

@end

@implementation CSTableView

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
    [self.contentView addSubview:self.tableView];
}

- (void)setupConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsZero);
    }];
}

- (UITableView*)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = RandomColor;
        _tableView.rowHeight = 44;
//        _tableView.sectionHeaderHeight = kTableViewCellHeight;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.showsVerticalScrollIndicator = NO;
//        _tableView.layer.masksToBounds = YES;
//        _tableView.layer.cornerRadius = 6.0;
//        _tableView.bounces = NO;
    }
    return _tableView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
