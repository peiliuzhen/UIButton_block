//
//  UIButton+Block.h
//  Block
//
//  Created by plz on 2021/4/2.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
 
typedef void(^ButtonTargetBlock)(UIButton * _Nullable button);
static void * _Nullable buttonEventsBlockKey = &buttonEventsBlockKey;

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Block)
/** 事件回调的block */
@property (nonatomic, copy) ButtonTargetBlock buttonTargetBlock;
- (void)addTargetEventforControlEvents:(UIControlEvents)controlEvents block:(void (^)(UIButton * button))block;
@end

NS_ASSUME_NONNULL_END
