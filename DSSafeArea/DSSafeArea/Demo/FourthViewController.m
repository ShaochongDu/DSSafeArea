//
//  FourthViewController.m
//  DSSafeArea
//
//  Created by 杜 on 2021/1/20.
//

#import "FourthViewController.h"

#import "UIViewController+ConstraintBottomView.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    [self showBottomView:YES
              bottomView:self.bottomView
           contentHeight:kBottomViewHeight
                 animate:NO];
    self.bottomView.backgroundColor = UIColor.redColor;
    self.bottomView.contentViewHeight = kBottomViewHeight;
    self.bottomView.cornerRadii = CGSizeMake(5, 5);
}

- (IBAction)showHiddenBottomView:(UIButton *)sender {
    NSString *title = [sender titleForState:UIControlStateNormal];
    
    if ([title isEqualToString:@"显示"]) {
        [sender setTitle:@"隐藏" forState:UIControlStateNormal];
        
        [self showBottomView:YES
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                     animate:YES];
    } else {
        [sender setTitle:@"显示" forState:UIControlStateNormal];
        
        [self showBottomView:NO
                  bottomView:self.bottomView
               contentHeight:kBottomViewHeight
                     animate:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
