//
//  NSArray+Category.h
//
//
//  Created by beinie on 15/7/2.
//
//
#import <Foundation/Foundation.h>

@interface NSArray (Category)

-(NSString*)josnUTF8String;

+(NSArray *)arrayFromJsonUTF8String:(NSString*)string;

@end