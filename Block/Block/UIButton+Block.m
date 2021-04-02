//
//  UIButton+Block.m
//  Block
//
//  Created by plz on 2021/4/2.
//

#import "UIButton+Block.h"



@interface UIButton ()

 

@end

@implementation UIButton (Block)


-(ButtonTargetBlock)buttonTargetBlock
{
    return objc_getAssociatedObject(self, &buttonEventsBlockKey);
}
 
-(void)setButtonTargetBlock:(ButtonTargetBlock)buttonTargetBlock
{
    objc_setAssociatedObject(self, &buttonEventsBlockKey, buttonTargetBlock, OBJC_ASSOCIATION_COPY);
}
 
/**
 按钮添加回调block
 */
- (void)addTargetEventforControlEvents:(UIControlEvents)controlEvents block:(void (^)(UIButton * button))block
{
    self.buttonTargetBlock = block;
    [self addTarget:self action:@selector(blcokButtonClicked:) forControlEvents:controlEvents];
}
 
/**
 按钮点击事件
*/
- (void)blcokButtonClicked:(UIButton *)sender
{
    if (self.buttonTargetBlock)
    {
        self.buttonTargetBlock(sender);
    }
}
@end
