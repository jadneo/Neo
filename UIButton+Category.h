//
//  UIButtonItem+Category.h
//
//  Created by beinie on 15/7/2.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)


-(void)addTarget:(void(^)())targetBlock;

@end