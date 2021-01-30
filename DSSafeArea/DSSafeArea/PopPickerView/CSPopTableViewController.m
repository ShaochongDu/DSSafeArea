//
//  CSPopTableViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import "CSPopTableViewController.h"
#import "CSTableView.h"
#import "UIViewController+ConstraintBottomView.h"

@interface CSPopTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *topView;  //  上半区视图
@property (nonatomic, strong) CSTableView *bottomView; //  列表

@end

@implementation CSPopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    [self setupViews];
}

- (void)setupViews {
    self.topView = [UIView new];
    self.topView.backgroundColor = [UIColor blackColor];
    self.topView.alpha = 0.5;
    [self.view addSubview:self.topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.topView addGestureRecognizer:tap];
    
    self.bottomView = [CSTableView new];
    self.bottomView.tableView.delegate = self;
    self.bottomView.tableView.dataSource = self;
    [self.view addSubview:self.bottomView];
    
    [self showBottomView:NO animate:NO completed:nil];
    self.bottomView.contentViewHeight = 300;
    self.bottomView.cornerRadii = CGSizeMake(6, 6);
}

#pragma mark - UITapGestureRecognizer
//  点击上半部视图 dismiss
- (void)tapGesture:(UITapGestureRecognizer *)gesuture {
    [self dissmissSelf];
}

#pragma mark - interface

#pragma mark - interface

- (void)show {
    [self showWithSetting:nil];
}

- (void)showWithSetting:(CSTableSetting *)settting {
//    if (settting) {
//        self.pickerViewHeight = settting.pickerViewHeight;
//    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController addChildViewController:self];
    [window.rootViewController.view addSubview:self.view];
    
//    if (settting) {
//        //  需等pickerView创建后赋值
//        self.pickerView.pickerSetting = settting;
//    }
    NSLog(@"1---%@", window.rootViewController.view.safeAreaInsets);
    NSLog(@"2---%@", self.view.safeAreaInsets);
    
    [self showBottomView:YES animate:YES completed:nil];
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
           contentHeight:300
               tableView:self.topView
                 animate:animate
     animationsCompleted:complete];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = HexColor(0x353535, 1);
        cell.textLabel.font = PFRegularFont(16);
    }
    cell.textLabel.text = @"北京学习中心";
    return cell;
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
