//
//  ViewController.m
//  Block
//
//  Created by plz on 2021/4/2.
//

#import "ViewController.h"
#import "UIButton+Block.h"
#import "HomeViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.button];
    __weak typeof(self) weakSelf = self;
    self.button.buttonTargetBlock = ^(UIButton *button) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        HomeViewController *vc =[[HomeViewController alloc]init];
        
        [strongSelf presentViewController:vc animated:YES completion:nil];
    };

}

-(UIButton *)button{
    if (!_button) {
        _button =[UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame=CGRectMake(100, 200, 100, 100);
        _button.backgroundColor=UIColor.redColor;
        [_button addTargetEventforControlEvents:UIControlEventTouchUpInside block:^(UIButton * _Nonnull button) {
         
        }];
        
    }
    return _button;
}

@end
