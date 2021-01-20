//
//  ViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"底部视图安全域适配";
    
    [self showBottomView:YES
              bottomView:self.bottomView
           contentHeight:kBottomViewHeight
               tableView:self.tableView
                 animate:NO];
    
    self.bottomView.contentViewHeight = kBottomViewHeight;
    // 1. 直接设置底部视图圆角
//    self.bottomView.layer.masksToBounds = YES;
//    self.bottomView.layer.cornerRadius = 5;
    // 2. 仅设置contentview圆角
    self.bottomView.cornerRadii = CGSizeMake(5, 5);
}

#pragma mark - <#comment#>

- (IBAction)showHiddenBottom:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    //  显示隐藏更改约束有两种方式
    //  1. 使用updateConstraints方式，仅更改bottomview的top值
    //  2. 使用remakeConstraints方式，全部更改约束，此方式可以适配横竖屏，且无需计算高度
    //  注意：设置top或bottom时最好使用 make.bottom.mas_equalTo(self.view.mas_bottom);这种方式mas_bottom或mas_top
    if ([title isEqualToString:@"隐藏"]) {
        [sender setTitle:@"显示" forState:UIControlStateNormal];
        
        [self showBottomView:NO
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                   tableView:self.tableView
                     animate:YES];
    } else {
        [sender setTitle:@"隐藏" forState:UIControlStateNormal];
        
        [self showBottomView:YES
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                   tableView:self.tableView
                     animate:YES];
    }
}



@end
