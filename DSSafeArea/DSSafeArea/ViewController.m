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
