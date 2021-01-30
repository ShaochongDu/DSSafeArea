//
//  UIFont+HTExtension.h
//  HuaTuOnLine
//
//  Created by 杜 on 2020/12/9.
//  Copyright © 2020 HTZX. All rights reserved.
//

//  字体相关

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HTFontWeightStyle) {
    HTFontWeightStyleMedium, // 中黑体
    HTFontWeightStyleSemibold, // 中粗体
    HTFontWeightStyleLight, // 细体
    HTFontWeightStyleUltralight, // 极细体
    HTFontWeightStyleRegular, // 常规体
    HTFontWeightStyleThin, // 纤细体
};

@interface UIFont (HTExtension)

/// 苹方字体
/// @param fontWeight 字体粗细（字重)
/// @param fontSize 字体大小
+ (UIFont *)pingFangSCWithWeight:(HTFontWeightStyle)fontWeight size:(CGFloat)fontSize;

/// 平方 - 中黑体
/// @param fontSize 字体大小
+ (UIFont *)pingFangSCMediumSize:(CGFloat)fontSize;

/// 平方 - 常规体
/// @param fontSize 字体大小
+ (UIFont *)pingFangSCRegularSize:(CGFloat)fontSize;

/// 平方 - 粗体
/// @param fontSize 字体大小
+ (UIFont *)pingFangSCSemiboldSize:(CGFloat)fontSize;

/// 平方 - 细体
/// @param fontSize 字体大小
+ (UIFont *)pingFangSCLightSize:(CGFloat)fontSize;

/// 平方 - 纤细体
/// @param fontSize 字体大小
+ (UIFont *)pingFangSCThinSize:(CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
