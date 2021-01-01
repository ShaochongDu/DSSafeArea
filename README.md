# 底部操作视图安全域适配
底部安全域适配，结合Masonry进行配置跟简单快捷

场景：
我们经常会遇到需要在某个页面底部配置操作按钮，比如底部需要添加一个view，view上包含两个按钮，一个点赞、一个分享、一个收藏。
此时我们有两种适配方式：
* 全局宏定义，根据是否x系列手机，计算出底部安全域高度，然后通过frame方式设置底部视图高度（比较笨拙）
* 使用Masonry则简单很多，可直接通过安全域设置即可

但也可能出现另一个问题，即：底部view不能通到屏幕最底部，导致页面不协调，当前demo就是解决此问题

实现也很简单，举个🌰，页面A中上半部分为tableview，底部为bottomview（包含点赞、收藏），按照以下步骤设置即可：
1. 建立基类，基类中包含一个contentView
2. Masonry约束contentview，但不设置高度，仅约束上左右
3. 将自定义的底部视图bottomview继承至基类，将点赞、收藏按钮添加至基类contentview中，并设置约束（基于contentview）
4. 约束bottomview的左右下为当前view（不区分是否x系列屏幕），上为tableview底部
5. 设置基类中contentview的高度即可

![safeArea.gif](https://upload-images.jianshu.io/upload_images/1186277-b0f82eceb830096a.gif?imageMogr2/auto-orient/strip)

