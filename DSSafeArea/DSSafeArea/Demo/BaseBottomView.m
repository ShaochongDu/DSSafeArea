//
//  BaseBottomView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

#import "BaseBottomView.h"

@interface BaseBottomView ()

/// 遮罩视图，若视图做了圆角设置，则可设置为yes，防止非x系列手机底部包含圆角
@property (nonatomic, strong) UIView *maskView;

@end

@implementation BaseBottomView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBaseBottomViews];
        [self setupBaseBottomViewConstraints];
        
//        self.backgroundColor = [self randomColor];
    }
    return self;
}

- (void)setupBaseBottomViews {
    self.contentView = [UIView new];
//    self.contentView.backgroundColor = [self randomColor];
    [self addSubview:self.contentView];
}

- (void)setupBaseBottomViewConstraints {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
    }];
}

-(void)setContentViewHeight:(CGFloat)contentViewHeight {
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentViewHeight);
    }];
}

- (UIColor *)randomColor {
    CGFloat red = arc4random()%255/255.0;
    CGFloat green = arc4random()%255/255.0;
    CGFloat blue = arc4random()%255/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.cornerRadii.width <= 0 || self.cornerRadii.height <= 0) {
        return;
    }
    self.backgroundColor = UIColor.clearColor;
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.contentView.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:self.cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.contentView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.contentView.layer.mask = maskLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
