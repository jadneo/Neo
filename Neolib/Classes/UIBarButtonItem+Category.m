//
//  UIBarButtonItem+Category.m
//  
//
//  Created by beinie on 15/7/2.
//
//

#import "UIBarButtonItem+Category.h"
#import <objc/runtime.h>

//@interface UIBarButtonActionItem : UIBarButtonItem
//
//@property (copy) void(^actionBlock)();
//
//@end
//@implementation UIBarButtonActionItem
//
//@end
//
//
//static char UIBarButtonItemTargetBlock;

@implementation UIBarButtonItem(Category)


//-(UIBarButtonItem*)initWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style actionBlock:(void(^)())actionblick{
//    [self uiBarButtonItemTarget];
//    UIBarButtonItem *b = [[UIBarButtonItem  alloc] initWithTitle:title style:style target:self
//                                                                      action:@selector(uiBarButtonItemTarget)];
//    UIBarButtonActionItem *a = [[UIBarButtonActionItem alloc] init];
//    
//    if (actionblick) {
//        a.actionBlock = actionblick;
//    }
//    objc_setAssociatedObject(self, &UIBarButtonItemTargetBlock, a, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    return b;
//}
//-(void)uiBarButtonItemTarget{
//    UIBarButtonActionItem *ba = objc_getAssociatedObject(self, &UIBarButtonItemTargetBlock);
//    if (ba.actionBlock) {
//        ba.actionBlock();
//    }
//
//}

@end