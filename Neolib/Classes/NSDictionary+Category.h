//
//  NSDictionary+Category.h
//
//
//  Created by beinie on 15/7/2.
//
//
#import <Foundation/Foundation.h>

@interface NSDictionary (Category)

-(NSString*)josnUTF8String;

-(NSString*)toString;

-(NSString*)stringForKey:(NSString*)key;

-(NSMutableArray*)mutableArrayForKey:(NSString *)key;

-(NSArray*)arrayForKey:(NSString *)key;

-(NSNumber*)numberForKey:(NSString *)key;

-(NSMutableDictionary*)dictionaryForKey:(NSString*)key;



@end