//
//  NSArray+Category.m
//  
//
//  Created by beinie on 15/7/2.
//
//

@implementation NSArray (Category)


-(NSString*)josnUTF8String{
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:0 error:nil] encoding:NSUTF8StringEncoding];
}
+(NSArray *)arrayFromJsonUTF8String:(NSString*)string{
    return [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
}

@end