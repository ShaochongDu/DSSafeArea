//
//  UIFont+HTExtension.m
//  HuaTuOnLine
//
//  Created by 杜 on 2020/12/9.
//  Copyright © 2020 HTZX. All rights reserved.
//

#import "UIFont+HTExtension.h"

@implementation UIFont (HTExtension)

+ (UIFont *)pingFangSCWithWeight:(HTFontWeightStyle)fontWeight size:(CGFloat)fontSize {
    if (fontWeight < HTFontWeightStyleMedium || fontWeight > HTFontWeightStyleThin) {
        fontWeight = HTFontWeightStyleRegular;
    }

    NSString *fontName = @"PingFangSC-Regular";
    switch (fontWeight) {
        case HTFontWeightStyleMedium:
            fontName = @"PingFangSC-Medium";
            break;
        case HTFontWeightStyleSemibold:
            fontName = @"PingFangSC-Semibold";
            break;
        case HTFontWeightStyleLight:
            fontName = @"PingFangSC-Light";
            break;
        case HTFontWeightStyleUltralight:
            fontName = @"PingFangSC-Ultralight";
            break;
        case HTFontWeightStyleRegular:
            fontName = @"PingFangSC-Regular";
            break;
        case HTFontWeightStyleThin:
            fontName = @"PingFangSC-Thin";
            break;
    }

    UIFont *font = [UIFont fontWithName:fontName size:fontSize];

    return font ?: [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)pingFangSCMediumSize:(CGFloat)fontSize {
    return [self pingFangSCWithWeight:HTFontWeightStyleMedium size:fontSize];
}

+ (UIFont *)pingFangSCRegularSize:(CGFloat)fontSize {
    return [self pingFangSCWithWeight:HTFontWeightStyleRegular size:fontSize];
}

+ (UIFont *)pingFangSCSemiboldSize:(CGFloat)fontSize {
    return [self pingFangSCWithWeight:HTFontWeightStyleSemibold size:fontSize];
}

+ (UIFont *)pingFangSCLightSize:(CGFloat)fontSize {
    return [self pingFangSCWithWeight:HTFontWeightStyleLight size:fontSize];
}

+ (UIFont *)pingFangSCThinSize:(CGFloat)fontSize {
    return [self pingFangSCWithWeight:HTFontWeightStyleThin size:fontSize];
}

@end
