//
//  CSPopTableHeaderView.h
//  DSSafeArea
//
//  Created by 杜 on 2021/2/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CSCloseBlock)(void);

@interface CSPopTableHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) CSCloseBlock closeBlock;

@property (nonatomic, copy) NSString *title;


@end

NS_ASSUME_NONNULL_END
