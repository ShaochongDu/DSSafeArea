# 底部操作视图安全域适配
底部安全域适配，结合Masonry进行配置跟简单快捷

![safeArea.gif](https://upload-images.jianshu.io/upload_images/1186277-dca7bc729aa4d640.gif?imageMogr2/auto-orient/strip)

## 场景：
我们经常会遇到需要在某个页面底部配置操作按钮，比如底部需要添加一个view，view上包含两个按钮，一个点赞、一个分享、一个收藏。
此时我们有两种适配方式：
* 全局宏定义，根据是否x系列手机，计算出底部安全域高度，然后通过frame方式设置底部视图高度（比较笨拙）
* 使用Masonry则简单很多，可直接通过安全域设置即可

但也可能出现另一个问题，即：底部view不能通到屏幕最底部，导致页面不协调，当前demo就是解决此问题

## 解决方案
实现也很简单，举个🌰，页面A中上半部分为tableview，底部为bottomview（包含点赞、收藏），按照以下步骤设置即可：
1. 建立基类，基类中包含一个contentView
2. Masonry约束contentview，但不设置高度，仅约束上左右
3. 将自定义的底部视图bottomview继承至基类，将点赞、收藏按钮添加至基类contentview中，并设置约束（基于contentview）
4. 约束bottomview的左右下为当前view（不区分是否x系列屏幕），上为tableview底部
5. 设置基类中contentview的高度即可

## 弹出视图应用
#### 弹出日期选择器

```
NSArray *dataArray = @[@"幼儿园",@"小学",@"中学",@"高中",@"大学",@"社会",@"领导",@"老板",@"CEO"];
CSPickerViewController *popVC = [CSPickerViewController new];
popVC.selectDoneBlock = ^(NSInteger index) {
    NSString *stage = dataArray[index];
    NSLog(@"index--%ld----%@",index, stage);
    [sender setTitle:stage forState:UIControlStateNormal];
};
popVC.dataArray = dataArray;
//    [popVC show];//直接展示

//  配置toolbar文字
CSPopPickerSetting *setting = [CSPopPickerSetting new];
//    setting.pickerViewHeight = 300;
setting.selectRow = 3;
CSToolBarSetting *barSetting = [CSToolBarSetting new];
barSetting.leftTitle = @"cancel";
barSetting.leftColor = RandomColor;
barSetting.title = @"标题";
barSetting.titleColor = RandomColor;
barSetting.rightTitle = @"done";
barSetting.rightColor = RandomColor;
setting.barSetting = barSetting;
[popVC showWithSetting:setting];
```

#### 弹出列表

```
NSArray *dataArray = @[@"幼儿园",@"小学",@"中学",@"高中",@"大学",@"社会",@"领导",@"老板",@"CEO",
                       @"幼儿园",@"小学",@"中学",@"高中",@"大学",@"社会",@"领导",@"老板",@"CEO"];
CSPopTableViewController *popVC = [CSPopTableViewController new];
popVC.dataArray = dataArray;
popVC.selectIndexBlock = ^(NSIndexPath * indexPath) {
    NSString *stage = dataArray[indexPath.row];
    NSLog(@"index--%@----%@",indexPath, stage);
    [sender setTitle:stage forState:UIControlStateNormal];
};
//    [popVC show]; //  直接展示
    
//  配置展示
CSPopTableSetting *setting = [CSPopTableSetting new];
//    setting.toolBarStyle = CSToolBarHeaderView;
//    setting.headerTitle = @"请选择";
    
//  固定比例
//    setting.heightStyle = CSTableFixedRatio;
//    setting.fixRatio = 0.8;
    
//  动态比例
setting.heightStyle = CSTableDynamicRatio;
setting.fixRatio = 0.6;
    
// 配置toolbar
setting.toolBarStyle = CSToolBarCustomerView;
CSToolBarSetting *barSetting = [CSToolBarSetting new];
barSetting.leftTitle = @"cancel";
barSetting.leftColor = RandomColor;
barSetting.title = @"标题";
barSetting.titleColor = RandomColor;
barSetting.rightTitle = @"done";
barSetting.rightColor = RandomColor;
setting.barSetting = barSetting;
    
[popVC showWithSetting:setting];
```
