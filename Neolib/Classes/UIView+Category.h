
//
//  UIView+Category.h
//
//  Created by beinie on 15/7/2.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

- (NSArray *)superviews ;

- (void)fadeOut ;

- (void)fadeOutAndRemoveFromSuperview ;

- (void)fadeIn ;

- (void)removeAllSubviews ;

#pragma mark - Size shortcuts

@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

/**
 * Return the coordinate on the screen.
 */
- (CGPoint)clientToScreen:(CGPoint)pt;


- (void)setTapActionWithBlock:(void (^)(void))block;

- (void)setLongPressActionWithBlock:(void (^)(void))block;

- (UIImage *)viewImage;

@end