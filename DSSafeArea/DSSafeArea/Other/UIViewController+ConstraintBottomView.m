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
                 animate:NO];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
               animate:(BOOL)animate {
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
    [self layoutViews:animate];
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
                 animate:NO];
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
                 animate:animate];
}

- (void)showBottomView:(BOOL)show
            bottomView:(UIView *)bottomView
         contentHeight:(CGFloat)contentHeight
             tableView:(UIView *)tableView
               topView:(UIView *)topView
               animate:(BOOL)animate {
    if (show) {
        //  更新tablview
        [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.mas_equalTo(topView.mas_bottom);
            } else {
                make.top.mas_equalTo(self.view);
            }
            if (@available(iOS 11.0, *)) {
                make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-contentHeight);
            } else {
                make.bottom.mas_equalTo(-contentHeight);
            }
            make.left.right.mas_equalTo(self.view);
        }];
        
        //  展示bottomview
        [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //  1.固定值方式 仅更改top值
            //            make.top.mas_equalTo(self.tableView.bottom);
            //  2. 重新设置约束
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(tableView.mas_bottom);
        }];
    } else {
        //  更新tablview
        [tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (topView) {
                make.top.mas_equalTo(topView.mas_bottom);
            } else {
                make.top.mas_equalTo(self.view);
            }
            make.left.right.bottom.mas_equalTo(self.view);
        }];
        
        //  隐藏bottomview，使用remake方式适配横竖屏
        [bottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
            //  1.固定值方式 仅更改top值
            //            make.top.mas_equalTo(self.view.height);
            //  2. 重新设置约束
            make.left.right.bottom.mas_equalTo(self.view);
            make.top.mas_equalTo(self.view.mas_bottom);
        }];
    }
        
    [self layoutViews:animate];
}

- (void)layoutViews:(BOOL)animate {
    // tell constraints they need updating
    [self.view setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self.view updateConstraintsIfNeeded];
    
    if (animate) {
        [UIView animateWithDuration:0.25 animations:^{
            [self.view layoutIfNeeded];
        }];
    } else {
        [self.view layoutIfNeeded];
    }
}

@end
