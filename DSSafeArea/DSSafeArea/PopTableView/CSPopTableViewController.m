//
//  CSPopTableViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import "CSPopTableViewController.h"
#import "CSTableView.h"
#import "CSPopTableHeaderView.h"
#import "CSPopTableViewCell.h"
#import "UIViewController+ConstraintBottomView.h"

@implementation CSPopTableSetting

-(instancetype)init {
    self = [super init];
    if (self) {
        _headerTitle = @"请选择";
        _fixHeight = 300;
        _fixRatio = 1/4.0;
        _dynamicRatio = 1/2.0;
    }
    return self;
}

@end



@interface CSPopTableViewController ()<UITableViewDelegate, UITableViewDataSource, CSPickerViewProtocol>

@property (nonatomic, strong) UIView *topView;  //  上半区视图
@property (nonatomic, strong) CSTableView *bottomView; //  列表
@property (nonatomic, strong) NSIndexPath *selectIndexPath;

@property (nonatomic, strong) CSPopTableHeaderView *tableHeaderView;
@property (nonatomic, strong) CSPopTableSetting *popTableSetting;

@property (nonatomic, assign) CGFloat tableViewHeight;  //  table高度

@end

@implementation CSPopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.clearColor;
    [self setupViews];
}

- (void)setupViews {
    self.topView = [UIView new];
    self.topView.backgroundColor = [UIColor blackColor];
    self.topView.alpha = 0;
    [self.view addSubview:self.topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.topView addGestureRecognizer:tap];
    
    self.bottomView = [CSTableView new];
    self.bottomView.tableView.delegate = self;
    self.bottomView.tableView.dataSource = self;
    [self.view addSubview:self.bottomView];
    
    //  在show前设置
    [self setTopToolViews];
    
    [self showBottomView:NO animate:NO completed:nil];
    self.bottomView.contentViewHeight = [self getTableViewHeight];
    self.bottomView.cornerRadii = CGSizeMake(6, 6);
    
    [self registReusedViews];
}

- (CGFloat)getTableViewHeight {
    switch (self.popTableSetting.heightStyle) {
        case CSTableFixedRatio:
            return self.view.height * self.popTableSetting.fixRatio;
            break;
        case CSTableDynamicRatio:
        {
            CGFloat dataRowHeight = self.dataArray.count * 44;
            if (self.popTableSetting.toolBarStyle != CSToolBarNone) {
                dataRowHeight += 44;
            }
            CGFloat maxHeight = self.popTableSetting.dynamicRatio * self.view.height;
            return MIN(dataRowHeight, maxHeight);
            break;
        }
        default:
            return self.popTableSetting.fixHeight;
            break;
    }
}

#pragma mark - views

- (void)registReusedViews {
    [self.bottomView.tableView registerClass:CSPopTableHeaderView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(CSPopTableHeaderView.class)];
    
    [self.bottomView.tableView registerClass:CSPopTableViewCell.class forCellReuseIdentifier:NSStringFromClass(CSPopTableViewCell.class)];
}

- (void)setTopToolViews {
    switch (self.popTableSetting.toolBarStyle) {
        case CSToolBarHeaderView:
        {
            self.tableHeaderView.title = self.popTableSetting.headerTitle;

            //  配置headerview高度自适应
            [self.tableHeaderView layoutIfNeeded];
            CGSize size = [self.tableHeaderView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
            self.tableHeaderView.frame = CGRectMake(0, 0, size.width, size.height);
            self.bottomView.tableView.tableHeaderView = self.tableHeaderView;
        }
            break;
        case CSToolBarCustomerView:
        {
            [self.bottomView setToolBar];
            self.bottomView.delegate = self;
        }
            break;
        default:
            break;
    }
}

- (CSPopTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[CSPopTableHeaderView alloc] initWithFrame:CGRectZero];
        __weak typeof(self) weakSelf = self;
        _tableHeaderView.closeBlock = ^{
            [weakSelf dissmissSelf];
        };
    }
    return _tableHeaderView;
}

#pragma mark - UITapGestureRecognizer
//  点击上半部视图 dismiss
- (void)tapGesture:(UITapGestureRecognizer *)gesuture {
    [self dissmissSelf];
}

#pragma mark - interface

- (void)show {
    [self showWithSetting:nil];
}

- (void)showWithSetting:(CSPopTableSetting *)settting {
    self.popTableSetting = settting;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController addChildViewController:self];
    [window.rootViewController.view addSubview:self.view];
    
    self.bottomView.tableSetting = settting;
    
    [window.rootViewController showBottomView:YES
                                   bottomView:self.bottomView
                                contentHeight:[self getTableViewHeight]
                                    tableView:self.topView
                                      animate:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.topView.alpha = 0.5;
    }];
}


#pragma mark - HTPickerViewToolBarProtocol

- (void)clickCancelBtn:(UIButton *)btn {
    [self dissmissSelf];
}

- (void)dissmissSelf {
    [self showBottomView:NO animate:YES completed:^{
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

/// 展示pickerview
/// @param show 是否展示
/// @param animate 是否动画
- (void)showBottomView:(BOOL)show animate:(BOOL)animate completed:(void(^)(void))complete {
    [self showBottomView:show
              bottomView:self.bottomView
           contentHeight:[self getTableViewHeight]
               tableView:self.topView
                 animate:animate
     animationsCompleted:complete];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CSPopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CSPopTableViewCell class])];
    cell.title = self.dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectIndexPath = indexPath;
    
    if (self.popTableSetting.toolBarStyle != CSToolBarCustomerView) {
        if (self.selectIndexBlock) {
            self.selectIndexBlock(indexPath);
        }
        [self dissmissSelf];
    }
}

- (void)tableToolViewCancel:(UIButton *)btn {
    [self dissmissSelf];
}

- (void)tableToolViewDone:(UIButton *)btn {
    [self dissmissSelf];
    if (self.selectIndexBlock) {
        self.selectIndexBlock(self.selectIndexPath);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
