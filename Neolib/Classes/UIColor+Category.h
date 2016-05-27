
//
//  UIColor+Category.h
//
//  Created by beinie on 15/7/2.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)


+ (UIColor *)colorWithHexString: (NSString *) hexString;


+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height;
+ (UIColor *)randomColor;

@end