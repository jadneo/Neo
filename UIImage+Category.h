
//
//  UIImage+Category.h
//
//  Created by beinie on 15/7/2.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)


+ (UIImage *)imageFromUIColor:(UIColor *)color;

+ (UIImage *)screenshot;

- (UIImage*)scaleToSize:(CGSize)newSize;

- (UIImage *)fixOrientation;
@end