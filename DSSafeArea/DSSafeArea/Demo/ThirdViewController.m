//
//  ThirdViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import "ThirdViewController.h"
#import "UIViewController+ConstraintBottomView.h"

#import "CSPickerViewController.h"

#import "CSPopTableViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor greenColor];
    [self showBottomView:NO
              bottomView:self.bottomView
           contentHeight:kBottomViewHeight
                 animate:NO];
    self.bottomView.contentViewHeight = kBottomViewHeight;
    self.bottomView.cornerRadii = CGSizeMake(5, 5);
}

- (IBAction)showHiddenBottomView:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    if ([title isEqualToString:@"显示底部视图"]) {
        [sender setTitle:@"隐藏底部视图" forState:UIControlStateNormal];
        [self showBottomView:YES
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                     animate:YES];
    } else {
        [sender setTitle:@"显示底部视图" forState:UIControlStateNormal];
        [self showBottomView:NO
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                     animate:YES];
    }
}
- (IBAction)datePickerAction:(UIButton *)sender {
    CSPickerViewController *popVC = [CSPickerViewController new];
    // 一维数组
    NSArray *dataArray = @[@"幼儿园",@"小学",@"中学",@"高中",@"大学",@"社会",@"领导",@"老板",@"CEO"];
    popVC.selectDoneBlock = ^(NSIndexPath *indexPath) {
        NSString *stage = dataArray[indexPath.row];
        NSLog(@"index--%ld----%@",indexPath.row, stage);
        [sender setTitle:stage forState:UIControlStateNormal];
    };
    popVC.dataArray = dataArray;
    
    [popVC show];
    
//    CSPopPickerSetting *setting = [CSPopPickerSetting new];
////    setting.pickerViewHeight = 300;
//    setting.selectRow = 3;
//    CSToolBarSetting *barSetting = [CSToolBarSetting new];
//    barSetting.leftTitle = @"cancel";
//    barSetting.leftColor = RandomColor;
//    barSetting.title = @"标题";
//    barSetting.titleColor = RandomColor;
//    barSetting.rightTitle = @"done";
//    barSetting.rightColor = RandomColor;
//    setting.barSetting = barSetting;
//    [popVC showWithSetting:setting];
}

- (IBAction)pickerViewTwo:(id)sender {
    CSPickerViewController *popVC = [CSPickerViewController new];
    //  二维数组
    NSArray *dataArray = @[@"中国",@"日本"];
    NSDictionary *dataDic = @{@"中国": @[@"北京",@"天津",@"上海",@"重庆"],
                              @"日本": @[@"东京",@"大阪",@"横浜",@"名古屋"]
                          };
    popVC.dataArray = dataArray;
    popVC.dataDic = dataDic;
    popVC.selectDoneBlock = ^(NSIndexPath *indexPath) {
        NSString *country = dataArray[indexPath.section];
        NSString *city = dataDic[country][indexPath.row];
        NSLog(@"indexPath--%@ -----%@-%@",indexPath, country, city);
        [sender setTitle:[NSString stringWithFormat:@"%@-%@",country, city] forState:UIControlStateNormal];
    };
    
    [popVC show];
}

- (IBAction)popTableView:(UIButton *)sender {
    NSArray *dataArray = @[@"幼儿园",@"小学",@"中学",@"高中",@"大学",@"社会",@"领导",@"老板",@"CEO",
                           @"幼儿园",@"小学",@"中学",@"高中",@"大学",@"社会",@"领导",@"老板",@"CEO"];
    CSPopTableViewController *popVC = [CSPopTableViewController new];
    popVC.dataArray = dataArray;
    popVC.selectIndexBlock = ^(NSIndexPath * indexPath) {
        NSString *stage = dataArray[indexPath.row];
        NSLog(@"index--%@----%@",indexPath, stage);
        [sender setTitle:stage forState:UIControlStateNormal];
    };
//    [popVC show];
    
    CSPopTableSetting *setting = [CSPopTableSetting new];
//    setting.toolBarStyle = CSToolBarHeaderView;
//    setting.headerTitle = @"请选择";
    
//    setting.heightStyle = CSTableFixedRatio;
//    setting.fixRatio = 0.8;
    
    setting.heightStyle = CSTableDynamicRatio;
    setting.fixRatio = 0.6;
    
    setting.toolBarStyle = CSToolBarCustomerView;
    CSToolBarSetting *barSetting = [CSToolBarSetting new];
    barSetting.leftTitle = @"cancel";
    barSetting.leftColor = RandomColor;
    barSetting.title = @"标题";
    barSetting.titleColor = RandomColor;
    barSetting.rightTitle = @"done";
    barSetting.rightColor = RandomColor;
    setting.barSetting = barSetting;
    
    [popVC showWithSetting:setting];
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
