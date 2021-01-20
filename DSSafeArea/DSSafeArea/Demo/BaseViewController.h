//
//  BaseViewController.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import <UIKit/UIKit.h>

#import "DSBottomView.h"

#import "UIViewController+ConstraintBottomView.h"

NS_ASSUME_NONNULL_BEGIN

static CGFloat kBottomViewHeight = 56.;

@interface BaseViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) DSBottomView *bottomView;

@end

NS_ASSUME_NONNULL_END
