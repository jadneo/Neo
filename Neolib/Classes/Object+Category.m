//
//  Object+Category.m
//  
//
//  Created by beinie on 15/7/23.
//
//

#import "Object+Category.h"


@implementation NSObject(Category)


-(BOOL)isArray{
    return [self isKindOfClass:[NSArray class]];
}

-(BOOL)isDictionary{
    return [self isKindOfClass:[NSDictionary class]];
}

@end