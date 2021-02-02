//
//  UIViewController+ConstraintBottomView.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import <UIKit/UIKit.h>



@interface UIViewController (ConstraintBottomView)

/// 以下接口调用前提
/// 视图必须已添加至controller视图!!!

#pragma mark - 独立控制底部视图

/// 独立控制底部视图
/// @param show 是否展示
/// @param bottomView 底部视
/// @param contentHeight 底部视图高度
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight;

/// 独立控制底部视图
/// @param show 是否展示
/// @param bottomView 底部视图
/// @param contentHeight 底部视图高度
/// @param animate 是否动画展示
/// @param complete 若animate=YES 则操作UI一定要在动画结束后的block中操作，防止动画延迟导致数据源不一致
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
               animate:(BOOL)animate
   animationsCompleted:complete;

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
/// @param complete 若animate=YES 则操作UI一定要在动画结束后的block中操作，防止动画延迟导致数据源不一致
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
            controller:(UIViewController *)viewController
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete;

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete;

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate;

/// 控制底部视图与相对视图展示
/// @param show 是否展示底部视图
/// @param bottomView 底部视图
/// @param viewController 相对的vc，默认为当前vc
/// @param contentHeight 底部视图高度
/// @param tableView 底部视图上方相对视图，一般为tablview，只要是UIView子类即可
/// @param topView tableView上方视图
/// @param animate 是否动画
/// @param complete 若animate=YES 则操作UI一定要在动画结束后的block中操作，防止动画延迟导致数据源不一致
- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
            controller:(UIViewController *)viewController
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete;

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete;

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate;

@end


