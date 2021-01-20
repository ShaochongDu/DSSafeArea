//
//  SecondViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import "SecondViewController.h"
#import "UIViewController+ConstraintBottomView.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIButton *topView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.topView.mas_bottom);
//        make.left.bottom.right.mas_equalTo(self.view);
//    }];
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.tableView.mas_bottom);
//        make.left.right.bottom.mas_equalTo(self.view);
//    }];
    
    [self showBottomView:NO
              bottomView:self.bottomView
           contentHeight:kBottomViewHeight
               tableView:self.tableView
                 topView:self.topView
                 animate:NO];
    
    self.bottomView.contentViewHeight = kBottomViewHeight;
    self.bottomView.cornerRadii = CGSizeMake(5, 5);
}
- (IBAction)showHiddenBottomView:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    if ([title isEqualToString:@"显示"]) {
        [sender setTitle:@"隐藏" forState:UIControlStateNormal];
        [self showBottomView:YES
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                   tableView:self.tableView
                     topView:self.topView
                     animate:YES];
    } else {
        [sender setTitle:@"显示" forState:UIControlStateNormal];
        [self showBottomView:NO
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                   tableView:self.tableView
                     topView:self.topView
                     animate:YES];
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
