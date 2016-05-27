//
//  UIBarButtonItem+Category.m
//  
//
//  Created by beinie on 15/7/2.
//
//

#import "UIButton+Category.h"
#import <objc/runtime.h>
static char UibuttonTargetBlock;

@implementation UIButton(Category)




-(void)UibuttonTargetAction:(UIButton*)sender{
    void (^action)(void) = objc_getAssociatedObject(self, &UibuttonTargetBlock);
    if (action) {
        action();
    }
}



-(void)addTarget:(void(^)())targetBlock{
    [self addTarget:self action:@selector(UibuttonTargetAction:) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(self, &UibuttonTargetBlock, targetBlock, OBJC_ASSOCIATION_COPY);
}

@end