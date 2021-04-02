//
//  HomeViewController.m
//  Block
//
//  Created by plz on 2021/4/2.
//

#import "HomeViewController.h"
#import "someManager.h"
#import "UIButton+Block.h"

@interface HomeViewController ()
{
    someManager *_manager;
}

@property (nonatomic, strong) NSNumber *flag;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIButton *button;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.blueColor;
    [self.view addSubview:self.button];
    __weak typeof(self) weakSelf = self;
    self.button.buttonTargetBlock = ^(UIButton *button) {
        NSLog(@"---button");
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.flag) {
            strongSelf.name = @"the name";
            [strongSelf->_manager reloadData:strongSelf.name];
        }
        else
        {
            strongSelf.name = nil;
            [strongSelf->_manager clearData];
        }
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

-(void)onClick{
    
}

@end

