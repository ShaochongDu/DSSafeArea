//
//  CSTableView.h
//  DSSafeArea
//
//  Created by 杜 on 2021/1/29.
//

#import "BaseBottomView.h"
@class CSPopTableSetting;

@protocol CSPickerViewProtocol <NSObject>

- (void)tableToolViewCancel:(UIButton *)btn;
- (void)tableToolViewDone:(UIButton *)btn;

@end



@interface CSTableView : BaseBottomView

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) CSPopTableSetting *tableSetting;

@property (nonatomic, weak) id<CSPickerViewProtocol> delegate;

/// 设置工具栏
- (void)setToolBar;

@end

