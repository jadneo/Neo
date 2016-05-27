
//
//  UIApplication+Category.h
//
//  Created by beinie on 15/7/2.
//


#import <UIKit/UIKit.h>

@interface UIApplication (Category)

- (NSURL *)documentsDirectoryURL ;

- (NSURL *)cachesDirectoryURL ;

- (NSURL *)downloadsDirectoryURL ;

- (NSURL *)libraryDirectoryURL ;

- (NSURL *)applicationSupportDirectoryURL ;

@end