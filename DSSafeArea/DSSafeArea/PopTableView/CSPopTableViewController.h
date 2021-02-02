//
//  CSPopTableViewController.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import <UIKit/UIKit.h>

#import "CSToolView.h"

/// table展示样式分类
typedef NS_ENUM(NSUInteger, CSTableHeightType) {
    CSTableFixedHeight, //  固定高度
    CSTableFixedRatio,   //  所占视图固定比例
    CSTableDynamicRatio,    // 所占视图动态比例最大值，否则动态计算
};

typedef NS_ENUM(NSUInteger, CSToolBarStyle) {
    CSToolBarNone,  // 无
    CSToolBarHeaderView, // 上部工具栏为 tableheaderview
    CSToolBarCustomerView, // 自定义view视图
};

@interface CSPopTableSetting : NSObject

@property (nonatomic, assign) CSTableHeightType heightStyle;  // tableview高度样式


@property (nonatomic, assign) CSToolBarStyle toolBarStyle;  //  工具栏样式，默认无

//  使用CSToolBarHeaderView
@property (nonatomic, copy) NSString *headerTitle;  // headerview标题

//  使用CSToolBarCustomerView
@property (nonatomic, strong) CSToolBarSetting *barSetting;


@property (nonatomic, assign) CGFloat fixHeight;    //  CSTableFixedHeight:固定高度值
@property (nonatomic, assign) CGFloat fixRatio;    //  CSTableFixedRatio:所占视图高度比例值
@property (nonatomic, assign) CGFloat dynamicRatio; //  CSTableDynamicRatio:动态计算高度,最大比例


@end



@interface CSPopTableViewController : UIViewController

@property (nonatomic, strong) NSArray<NSString *> *dataArray;

/// 点击回调
@property (nonatomic, copy) void(^selectIndexBlock)(NSIndexPath *);

/// 展示
- (void)show;

/// 设置配置 展示
/// @param settting 配置信息
- (void)showWithSetting:(CSPopTableSetting *)settting;


@end


