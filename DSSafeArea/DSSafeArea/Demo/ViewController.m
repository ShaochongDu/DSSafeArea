//
//  ViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

#import "ViewController.h"
#import "DSBottomView.h"

static CGFloat kBottomViewHeight = 56.;

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DSBottomView *bottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"底部视图安全域适配";
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-kBottomViewHeight);
        } else {
            make.bottom.mas_equalTo(-kBottomViewHeight);
        }
    }];
    
    self.bottomView = [DSBottomView new];
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.tableView.mas_bottom);
//        if (@available(iOS 11.0, *)) {
//            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
//        } else {
            make.bottom.mas_equalTo(self.view);
//        }
    }];
    self.bottomView.contentViewHeight = kBottomViewHeight;
    // 1. 直接设置底部视图圆角
//    self.bottomView.layer.masksToBounds = YES;
//    self.bottomView.layer.cornerRadius = 5;
    // 2. 仅设置contentview圆角
    self.bottomView.cornerRadii = CGSizeMake(5, 5);
}

-(UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.estimatedSectionFooterHeight = 0.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0f;
        
        self.extendedLayoutIncludesOpaqueBars = YES;
    }
    return _tableView;
}

#pragma mark - <#comment#>

- (IBAction)showHiddenBottom:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    //  显示隐藏更改约束有两种方式
    //  1. 使用updateConstraints方式，仅更改bottomview的top值
    //  2. 使用remakeConstraints方式，全部更改约束，此方式可以适配横竖屏，且无需计算高度
    if ([title isEqualToString:@"隐藏"]) {
        [sender setTitle:@"显示" forState:UIControlStateNormal];
        
        //  更新tablview
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        
        //  隐藏bottomview，使用remake方式适配横竖屏
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //  1.固定值方式 仅更改top值
            //            make.top.mas_equalTo(self.view.height);
            //  2. 重新设置约束
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view.mas_bottom);
        }];
        [self layoutSelfViews];
    } else {
        [sender setTitle:@"隐藏" forState:UIControlStateNormal];
        //  更新tablview
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-kBottomViewHeight);
            } else {
                make.bottom.mas_equalTo(-kBottomViewHeight);
            }
        }];
        
        //  展示bottomview
        [self.bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //  1.固定值方式 仅更改top值
            //            make.top.mas_equalTo(self.tableView.bottom);
            //  2. 重新设置约束
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.tableView.mas_bottom);
        }];
        [self layoutSelfViews];
    }
}

- (void)layoutSelfViews {
    // tell constraints they need updating
    [self.view setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self.view updateConstraintsIfNeeded];

    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - <#comment#>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"index - %ld", indexPath.row];
    
    return cell;
}


@end
