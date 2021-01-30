//
//  UIViewController+ConstraintBottomView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import "UIViewController+ConstraintBottomView.h"

@implementation UIViewController (ConstraintBottomView)

#pragma mark - 独立控制底部视图

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight {
    [self showBottomView:show
              bottomView:bottomView
           contentHeight:contentHeight
                 animate:NO
     animationsCompleted:nil];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
               animate:(BOOL)animate {
    [self showBottomView:show
              bottomView:bottomView
           contentHeight:contentHeight
                 animate:animate
     animationsCompleted:nil];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
               animate:(BOOL)animate
   animationsCompleted:complete {
    if (show) {
        //  展示bottomview
        [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(self.view);
            make.height.mas_equalTo(contentHeight);
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.mas_equalTo(self.view.mas_bottom);
            }
        }];
    } else {
        //  隐藏bottomview，使用remake方式适配横竖屏
        [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view.mas_bottom);
        }];
    }

    [self layoutViewController:self animate:animate animationsCompleted:complete];
}

#pragma mark - 带有相对视图

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView {
    [self showBottomView:show
              bottomView:bottomView
           contentHeight:contentHeight
               tableView:tableView
                 topView:nil
                 animate:NO
     animationsCompleted:nil];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate {
    [self showBottomView:show
              bottomView:bottomView
           contentHeight:contentHeight
               tableView:tableView
                 topView:nil
                 animate:animate
     animationsCompleted:nil];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
            controller:(UIViewController *)viewController
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete {
    [self showBottomView:show
              bottomView:bottomView
              controller:viewController
           contentHeight:contentHeight
               tableView:tableView
                 topView:nil
                 animate:animate
     animationsCompleted:complete];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete {
    [self showBottomView:show
              bottomView:bottomView
           contentHeight:contentHeight
               tableView:tableView
                 topView:nil
                 animate:animate
     animationsCompleted:complete];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate {
    [self showBottomView:show
              bottomView:bottomView
           contentHeight:contentHeight
               tableView:tableView
                 topView:topView
                 animate:animate
     animationsCompleted:nil];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete {
    [self showBottomView:show
              bottomView:bottomView
              controller:nil
           contentHeight:contentHeight
               tableView:tableView
                 topView:topView
                 animate:animate
     animationsCompleted:complete];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
            controller:(UIViewController *)viewController
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate
   animationsCompleted:(void(^)(void))complete {
    UIViewController *vc = viewController ?: self;
    if (show) {
        //  更新tablview
        [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.mas_equalTo(topView.mas_bottom);
            } else {
                make.top.mas_equalTo(vc.view);
            }
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(vc.view.mas_safeAreaLayoutGuideBottom).offset(-contentHeight);
            } else {
                make.bottom.mas_equalTo(-contentHeight);
            }
            make.left.right.mas_equalTo(vc.view);
        }];
        
        //  展示bottomview
        if (bottomView.height > 0) {
            //  兼容未使用contenview的视图
            [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(vc.view);
                make.top.mas_equalTo(tableView.mas_bottom);
                make.height.mas_equalTo(bottomView.height);
            }];
        } else {
            [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                //  1.固定值方式 仅更改top值
                //            make.top.mas_equalTo(self.tableView.bottom);
                //  2. 重新设置约束
                make.left.right.bottom.mas_equalTo(vc.view);
                make.top.mas_equalTo(tableView.mas_bottom);
            }];
        }
    } else {
        //  更新tablview
        [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.mas_equalTo(topView.mas_bottom);
            } else {
                make.top.mas_equalTo(vc.view);
            }
            make.left.right.bottom.mas_equalTo(vc.view);
        }];
        
        //  隐藏bottomview，使用remake方式适配横竖屏
        if (bottomView.height > 0) {
            //  兼容未使用contenview的视图
            [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(vc.view);
                make.top.mas_equalTo(vc.view.mas_bottom);
                make.height.mas_equalTo(bottomView.height);
            }];
        } else {
            [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                //  1.固定值方式 仅更改top值
                //            make.top.mas_equalTo(self.view.height);
                //  2. 重新设置约束
                make.left.right.bottom.mas_equalTo(vc.view);
                make.top.mas_equalTo(vc.view.mas_bottom);
            }];
        }
    }
    
    [self layoutViewController:vc animate:animate animationsCompleted:complete];
}

- (void)layoutViewController:(UIViewController *)viewController animate:(BOOL)animate animationsCompleted:(void(^)(void))complete {
    // tell constraints they need updating
    [viewController.view setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [viewController.view updateConstraintsIfNeeded];
    
    if (animate) {
        [UIView animateWithDuration:0.25 animations:^{
            [viewController.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            if (complete) {
                complete();
            }
        }];
    } else {
        [viewController.view layoutIfNeeded];
        if (complete) {
            complete();
        }
    }
}

@end
