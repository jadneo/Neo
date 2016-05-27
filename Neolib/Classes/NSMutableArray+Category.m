//
//  NSMutableArray+Category.m
//  
//
//  Created by beinie on 15/7/2.
//
//
#import "NSMutableArray+Category.h"

@implementation NSMutableArray (Category)

+(NSMutableArray *)arrayFromJsonUTF8String:(NSString*)string{
    return [[NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil] mutableCopy];
}
-(void)toggleObject:(id)toggleObject{
    for (id a in self) {
        if (a==toggleObject) {
            [self removeObject:toggleObject];
            return;
        }
    }
    [self addObject:toggleObject];
}

@end