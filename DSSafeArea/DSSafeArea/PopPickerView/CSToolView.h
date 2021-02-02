//
//  CSToolView.h
//  DSSafeArea
//
//  Created by 杜 on 2021/2/2.
//

#import <UIKit/UIKit.h>

@interface CSToolBarSetting : NSObject

@property (nonatomic, copy) NSString *leftTitle; // 左侧标题
@property (nonatomic, strong) UIColor *leftColor;

@property (nonatomic, copy) NSString *title;    //  标题
@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, copy) NSString *rightTitle;   // 右侧标题
@property (nonatomic, strong) UIColor *rightColor;

@end

@interface CSToolView : UIView

@property (nonatomic, copy) void(^cancelBlock)(UIButton *);
@property (nonatomic, copy) void(^doneBlock)(UIButton *);

@property (nonatomic, strong) UIButton *cancelBtn;  //取消
@property (nonatomic, strong) UILabel *titleLabel;  //标题
@property (nonatomic, strong) UIButton *doneBtn;    //确定

/// 配置信息
@property (nonatomic, strong) CSToolBarSetting *toolBarSetting;

@end

