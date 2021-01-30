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

@interface CSPickerViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, CSPickerViewProtocol>

@property (nonatomic, strong) UIView *topView;  //  上半区视图
@property (nonatomic, strong) CSPickerView *pickerView; //  自定义时间选择器

@property (nonatomic, assign) CGFloat pickerViewHeight;// 高度：默认296

@property (nonatomic, assign) NSInteger selectIndex;    //  选择的索引

@end

@implementation CSPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectIndex = 0;
    self.pickerViewHeight = 296;
    
    [self setupViews];
}

- (void)setupViews {
    self.topView = [UIView new];
    self.topView.backgroundColor = [UIColor blackColor];
    self.topView.alpha = 0.5;
    [self.view addSubview:self.topView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    [self.topView addGestureRecognizer:tap];
    
    self.pickerView = [CSPickerView new];
    self.pickerView.delegate = self;
    self.pickerView.picker.delegate = self;
    self.pickerView.picker.dataSource = self;
    [self.view addSubview:self.pickerView];
    
    [self showPickView:NO animate:NO completed:nil];
    self.pickerView.contentViewHeight = self.pickerViewHeight;
    self.pickerView.cornerRadii = CGSizeMake(6, 6);
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

- (void)showWithSetting:(CSPickerSetting *)settting {
    if (settting) {
        self.pickerViewHeight = settting.pickerViewHeight;
    }
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window.rootViewController addChildViewController:self];
    [window.rootViewController.view addSubview:self.view];
    
    if (settting) {
        //  需等pickerView创建后赋值
        self.pickerView.pickerSetting = settting;
    }
    
    [self showPickView:YES animate:YES completed:nil];
}

/// 展示pickerview
/// @param show 是否展示
/// @param animate 是否动画
- (void)showPickView:(BOOL)show animate:(BOOL)animate completed:(void(^)(void))complete {
    [self showBottomView:show
              bottomView:self.pickerView
           contentHeight:self.pickerViewHeight
               tableView:self.topView
                 animate:animate
     animationsCompleted:complete];
}

#pragma mark - HTPickerViewToolBarProtocol

- (void)clickDoneBtn:(UIButton *)btn {
    [self dissmissSelf];
    if (self.selectDoneBlock) {
        self.selectDoneBlock(self.selectIndex);
    }
}

- (void)clickCancelBtn:(UIButton *)btn {
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
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

#pragma mark - UIPickerViewDelegate

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.dataArray[row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectIndex = row;
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
