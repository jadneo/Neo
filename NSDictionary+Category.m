//
//  NSDictionary+Category.m
//  
//
//  Created by beinie on 15/7/2.
//
//
#import "NSDictionary+Category.h"

@implementation NSDictionary (Category)


-(NSString*)josnUTF8String{
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:0 error:nil] encoding:NSUTF8StringEncoding];
}
-(NSString*)toString{
    NSMutableArray *arr= [NSMutableArray new];
    for (NSString*s in self.allKeys) {
        if ([[self objectForKey:s] isKindOfClass:[NSDictionary class]]) {
            NSDictionary*dic = [self objectForKey:s];
            [arr addObject:[NSString stringWithFormat:@"%@:%@",s,[dic toString]]];
        }else{
            [arr addObject:[NSString stringWithFormat:@"%@:%@",s,[self stringForKey:s]]];
        }
    }
    return [NSString stringWithFormat:@"{%@}",[arr componentsJoinedByString:@","]];
}


-(NSString*)stringForKey:(NSString*)key{
    if([self objectForKey:key]){
        return [NSString stringWithFormat:@"%@",[self objectForKey:key]];
    }else{
        return @"";
    }
//    return [self anyObjectForKey:key withNilBlock:^id() {
//        return @"";
//    }];
}
-(NSMutableArray *)mutableArrayForKey:(NSString *)key{
    return [self anyObjectForKey:key withNilBlock:^id{
        return [NSMutableArray new];
    }];
}
-(NSArray *)arrayForKey:(NSString *)key{
    return [self anyObjectForKey:key withNilBlock:^id{
        return [NSArray new];
    }];
}
-(NSNumber*)numberForKey:(NSString *)key{
    return [self anyObjectForKey:key withNilBlock:^id{
        return @0;
    }];
}

-(NSMutableDictionary*)dictionaryForKey:(NSString*)key{
    
    return [[self anyObjectForKey:key withNilBlock:^id{
        return [NSDictionary new];
    }] mutableCopy];
}


-(id)anyObjectForKey:(NSString*)key withNilBlock:(id(^)())block{
    return [[self objectForKey:key] isKindOfClass:[block() class]]?[self objectForKey:key]:block();
}



@end