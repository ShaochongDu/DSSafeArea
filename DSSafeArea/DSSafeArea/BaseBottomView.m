//
//  BaseBottomView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

#import "BaseBottomView.h"

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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
