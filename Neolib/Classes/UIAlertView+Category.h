//
//  UIAlertView+Category.h
//
//  Created by beinie on 15/7/2.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Category)

- (void)showWithCompletion:(void(^)(UIAlertView *alertView, NSInteger buttonIndex))completion ;


+ (void)showAlertViewWithTitle:(NSString*)title andMessage:(NSString *)message ;

+ (void)showAlertViewWithTitle:(NSString*)title ;

+ (void)showAlertViewWithError:(NSError*)error ;

@end