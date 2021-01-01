//
//  DSBottomView.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/1.
//

#import "DSBottomView.h"

@interface DSBottomView ()

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIButton *collectionBtn;

@end

@implementation DSBottomView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
        [self setupConstraints];
        
        self.backgroundColor = UIColor.purpleColor;
        self.contentView.backgroundColor = self.backgroundColor;
    }
    return self;
}

- (void)setupViews {
    //  控件需要添加至 基类contentview
    self.lineView = [UIView new];
    self.lineView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.lineView];
    
    self.likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.likeBtn addTarget:self action:@selector(likeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.likeBtn setTitleColor:UIColor.cyanColor forState:UIControlStateNormal];
    [self.likeBtn setTitle:@"点赞" forState:UIControlStateNormal];
    [self.contentView addSubview:self.likeBtn];
    
    self.collectionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.collectionBtn addTarget:self action:@selector(collectionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.collectionBtn setTitleColor:UIColor.magentaColor forState:UIControlStateNormal];
    [self.collectionBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [self.contentView addSubview:self.collectionBtn];
}

- (void)setupConstraints {
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(1.0);
    }];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom);
        make.left.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView).multipliedBy(0.5);
    }];
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom);
        make.right.bottom.mas_equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView).multipliedBy(0.5);
    }];
}

#pragma mark - actions

- (void)likeBtnAction:(UIButton *)btn {
    NSLog(@"like");
}

- (void)collectionBtnAction:(UIButton *)btn {
    NSLog(@"collection");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
