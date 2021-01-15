//
//  BaseBottomView.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

// 该基类处理底部视图，以适配安全域，使用方法如下：
// 1. 建立基类，基类中包含一个contentView
// 2. Masonry约束contentview，但不设置高度，仅约束上左右
// 3. 将自定义的底部视图bottomview继承至该类，将点赞、收藏按钮添加至基类contentview中，并设置约束（基于contentview）
// 4. 约束bottomview的左右下为当前view（不区分是否x系列屏幕），上为tableview底部
// 5. 设置基类中contentview的高度即可


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseBottomView : UIView

/// 添加的视图一定要加载该视图上
@property (nonatomic, strong) UIView *contentView;

/// 底部视图内操作视图的高度
/// 一定要设置，需要更新约束
@property (nonatomic, assign) CGFloat contentViewHeight;

/// 设置contentview左上及右上圆角
/// 若要对整个底部控件设置圆角，可直接设置bottomview即可，无需设置此参数
@property (nonatomic, assign) CGSize cornerRadii;

/// 随机色
- (UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END
