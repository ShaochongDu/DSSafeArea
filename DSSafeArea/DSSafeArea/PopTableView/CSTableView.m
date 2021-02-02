//
//  CSTableView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import "CSTableView.h"
#import "CSPopTableViewController.h"
#import "CSToolView.h"

@interface CSTableView ()

@property (nonatomic, strong) CSToolView *toolView;

@end

@implementation CSTableView

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

-(void)setTableSetting:(CSPopTableSetting *)tableSetting {
    _tableSetting = tableSetting;
    
    self.toolView.toolBarSetting = tableSetting.barSetting;
}

- (void)setToolBar {
    self.toolView = [CSToolView new];
    [self.contentView addSubview:self.toolView];
    
    __weak typeof(self) weakSelf = self;
    self.toolView.cancelBlock = ^(UIButton * btn) {
        [weakSelf cancelAction:btn];
    };
    self.toolView.doneBlock = ^(UIButton * btn) {
        [weakSelf doneAction:btn];
    };
    
    [self.toolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(44);
    }];
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.toolView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
}

#pragma mark - action

- (void)cancelAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(tableToolViewCancel:)]) {
        [self.delegate tableToolViewCancel:btn];
    }
}

- (void)doneAction:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(tableToolViewDone:)]) {
        [self.delegate tableToolViewDone:btn];
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
