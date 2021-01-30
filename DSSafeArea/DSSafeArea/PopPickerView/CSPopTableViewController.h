//
//  CSPopTableViewController.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import <UIKit/UIKit.h>

/// table展示样式分类
typedef NS_ENUM(NSUInteger, CSTableStyle) {
    CSTableFixedHeight, //  固定高度
    CSTableFixedRatio,   //  所占视图固定比例
    CSTableDynamicRatio,    // 所占视图动态比例 设置最大值，否则动态计算
};

@interface CSTableSetting : NSObject

@property (nonatomic, assign) BOOL showToolBar; //  是否显示tableview上部操作视图

@property (nonatomic, assign) CSTableStyle tableStyle;

@property (nonatomic, assign) CGFloat fixHeight;    //  固定高度值
@property (nonatomic, assign) CGFloat ratio;    //  所占视图高度比例值



@end

NS_ASSUME_NONNULL_BEGIN

@interface CSPopTableViewController : UIViewController

@property (nonatomic, strong) NSArray<NSString *> *dataArray;

/// 展示
- (void)show;

/// 设置配置 展示
/// @param settting 配置信息
- (void)showWithSetting:(CSTableSetting *)settting;


@end

NS_ASSUME_NONNULL_END
