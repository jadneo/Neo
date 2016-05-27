//
//  NSMutableArray+Category.h
//
//
//  Created by beinie on 15/7/2.
//
//
#import <Foundation/Foundation.h>

@interface NSMutableArray (Category)


+(NSMutableArray *)arrayFromJsonUTF8String:(NSString*)string;
-(void)toggleObject:(id)toggleObject;




@end