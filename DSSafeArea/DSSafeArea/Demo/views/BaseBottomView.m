//
//  BaseBottomView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

#import "BaseBottomView.h"

@interface BaseBottomView ()

/// 底部view 用来填充铺满底部空白，可设置颜色以达到配色效果
@property (nonatomic, strong) UIView *maskBottomView;

@end

@implementation BaseBottomView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBaseBottomViews];
        [self setupBaseBottomViewConstraints];
        
//        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.5];
//        self.contentView.backgroundColor = UIColor.whiteColor;
//        self.maskBottomView.backgroundColor = RandomColor;
        
//        self.backgroundColor = [self randomColor];
    }
    return self;
}

- (void)setupBaseBottomViews {
    self.contentView = [UIView new];
    [self addSubview:self.contentView];
    
    self.maskBottomView = [UIView new];
    [self addSubview:self.maskBottomView];
}

- (void)setupBaseBottomViewConstraints {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
    }];
    [self.maskBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self);
    }];
}

-(void)setContentViewHeight:(CGFloat)contentViewHeight {
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentViewHeight);
    }];
}

-(void)setMaskBottomViewColor:(UIColor *)maskBottomViewColor {
    self.maskBottomView.backgroundColor = maskBottomViewColor;
}

- (UIColor *)randomColor {
    CGFloat red = arc4random()%255/255.0;
    CGFloat green = arc4random()%255/255.0;
    CGFloat blue = arc4random()%255/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.cornerRadii.width > 0 && self.cornerRadii.height > 0) {
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:self.cornerRadii];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.contentView.bounds;
        maskLayer.path = maskPath.CGPath;
        self.contentView.layer.mask = maskLayer;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
