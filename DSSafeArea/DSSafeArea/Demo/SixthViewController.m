//
//  SixthViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/22.
//

#import "SixthViewController.h"
#import "UIViewController+ConstraintBottomView.h"

@interface SixthViewController ()

@property (nonatomic, strong) UIButton *bottomBtn;

@end

@implementation SixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    //  直接使用自定义视图  没用继承BaseBottomView
    //  或者说没有使用contentview这种方式承载button按钮（不建议使用这种方式）
    [self.view addSubview:self.bottomBtn];
    
    self.bottomBtn.height = 50;
    
    [self showBottomView:YES bottomView:self.bottomBtn contentHeight:50 tableView:self.tableView];
}

- (UIButton *)bottomBtn {
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bottomBtn setTitle:@"提交按钮" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_bottomBtn setBackgroundColor:UIColor.redColor];
    }
    return _bottomBtn;
}

- (IBAction)showHiddenBottomView:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSLog(@"%.1f", self.bottomBtn.height);
    if ([title isEqualToString:@"显示"]) {
        [sender setTitle:@"隐藏" forState:UIControlStateNormal];
        [self showBottomView:YES bottomView:self.bottomBtn contentHeight:50 tableView:self.tableView animate:YES];
    } else {
        [sender setTitle:@"显示" forState:UIControlStateNormal];
        [self showBottomView:NO bottomView:self.bottomBtn contentHeight:50 tableView:self.tableView animate:YES];
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
