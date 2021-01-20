//
//  UIViewController+ConstraintBottomView.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ConstraintBottomView)

/// 以下接口调用前提
/// 视图必须已添加至controller视图!!!

#pragma mark - 独立控制底部视图

/// 独立控制底部视图
/// @param show 是否展示
/// @param bottomView 底部视图
/// @param contentHeight 底部视图高度
/// @param animate 是否动画展示
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
               animate:(BOOL)animate;

#pragma mark - 带有相对视图

/// 底部视图带有相对视图
/// @param show 是否展示
/// @param bottomView 底部视图
/// @param contentHeight 底部视图高度
/// @param tableView 底部视图上方相对视图，一般为tablview，只要是UIView子类即可
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView;

/// 底部视图带有相对视图（动画控制）
/// @param show 是否展示底部视图
/// @param bottomView 底部视图
/// @param contentHeight 底部视图高度
/// @param tableView 底部视图上方相对视图，一般为tablview，只要是UIView子类即可
/// @param animate 是否动画
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate;

/// 控制底部视图与相对视图展示
/// @param show 是否展示底部视图
/// @param bottomView 底部视图
/// @param contentHeight 底部视图高度
/// @param tableView 底部视图上方相对视图，一般为tablview，只要是UIView子类即可
/// @param topView tableView上方视图
/// @param animate 是否动画
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate;

@end

NS_ASSUME_NONNULL_END