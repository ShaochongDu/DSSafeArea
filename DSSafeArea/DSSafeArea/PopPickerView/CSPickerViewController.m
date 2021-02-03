//
//  CSPickerViewController.m
//  HuaTuOnLine
//
//  Created by 杜 on 2021/1/29.
//  Copyright © 2021 HTZX. All rights reserved.
//

#import "CSPickerViewController.h"
#import "CSPickerView.h"
#import "UIViewController+ConstraintBottomView.h"

@implementation CSPopPickerSetting

-(instancetype)init {
    self = [super init];
    if (self) {
        _pickerViewHeight = 296;
        _selectRow = 0;
    }
    return self;
}

@end

@interface CSPickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, CSPickerViewProtocol>

@property (nonatomic, strong) UIView *topView;  //  上半区视图
@property (nonatomic, strong) CSPickerView *pickerView; //  自定义时间选择器
@property (nonatomic, strong) NSIndexPath *selectIndexPath; //  选择的索引

@property (nonatomic, assign) NSInteger selectRow;// 二维数组，选择的第一列数据

@end

@implementation CSPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectRow = 0;
    
    [self setupViews];
}

- (void)setupViews {
    self.topView = [UIView new];
    self.topView.backgroundColor = [UIColor blackColor];
    self.topView.alpha = 0;
    [self.view addSubview:self.topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.topView addGestureRecognizer:tap];
    
    self.pickerView = [CSPickerView new];
    self.pickerView.delegate = self;
    self.pickerView.picker.delegate = self;
    self.pickerView.picker.dataSource = self;
    [self.view addSubview:self.pickerView];
    
    [self showPickView:NO animate:NO completed:nil];
    self.pickerView.contentViewHeight = [self getPickerViewHeight];
    self.pickerView.cornerRadii = CGSizeMake(6, 6);
}

- (CGFloat)getPickerViewHeight {
    return self.pickerView.pickerSetting.pickerViewHeight ?: 296;
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

- (void)showWithSetting:(CSPopPickerSetting *)settting {
    self.pickerView.pickerSetting = settting;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController addChildViewController:self];
    [window.rootViewController.view addSubview:self.view];
    
    //  需等pickerView创建后赋值，设置toolbar
    self.pickerView.pickerSetting = settting;
    
    [window.rootViewController showBottomView:YES
                                   bottomView:self.pickerView
                                contentHeight:[self getPickerViewHeight]
                                    tableView:self.topView
                                      animate:YES];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.topView.alpha = 0.5;
    }];
}

/// 展示pickerview
/// @param show 是否展示
/// @param animate 是否动画
- (void)showPickView:(BOOL)show animate:(BOOL)animate completed:(void(^)(void))complete {
    [self showBottomView:show
              bottomView:self.pickerView
           contentHeight:[self getPickerViewHeight]
               tableView:self.topView
                 animate:animate
     animationsCompleted:complete];
}

#pragma mark - HTPickerViewToolBarProtocol

- (void)pickerToolViewDone:(UIButton *)btn {
    [self dissmissSelf];
    if (self.selectDoneBlock) {
        self.selectDoneBlock(self.selectIndexPath);
    }
}

- (void)pickerToolViewCancel:(UIButton *)btn {
    [self dissmissSelf];
}

- (void)dissmissSelf {
    [self showPickView:NO animate:YES completed:^{
        [self willMoveToParentViewController:nil];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
    }];
}

#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.dataDic) {
        return self.dataArray.count;
    } else {
        return 1;
    }
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.dataDic) {
        if (component == 0) {
            return self.dataArray.count;
        } else {
            NSString *key = self.dataArray[self.selectRow];
            NSArray *dataArray = self.dataDic[key];
            return dataArray.count;
        }
    } else {
        return self.dataArray.count;
    }
}

#pragma mark - UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.dataDic) {
        if (component == 0) {
            return self.dataArray[row];
        } else {
            NSString *key = self.dataArray[self.selectRow];
            NSArray *dataArray = self.dataDic[key];
            return dataArray[row];
        }
    } else {
        return self.dataArray[row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.dataDic) {
        if (component == 0) {
            self.selectRow = row;
            [pickerView reloadComponent:1];
            [pickerView selectRow:0 inComponent:1 animated:YES];
        }
        self.selectIndexPath = [NSIndexPath indexPathForRow:row inSection:self.selectRow];
    } else {
        self.selectIndexPath = [NSIndexPath indexPathForRow:row inSection:0];
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
