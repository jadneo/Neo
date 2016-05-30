//
//  NSString+Category.m
//  
//
//  Created by beinie on 15/7/2.
//
//
#import "NSString+Category.h"

@implementation NSString (Category)

#pragma mark - Validations

- (BOOL)isNull {
    
    if(self == nil || [self isKindOfClass:[NSNull class]] || [self isEmpty]) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isEmpty {
    return [[self trimWhitespace] isEqualToString:@""];
}


- (BOOL)isEmail {
    
    //Create a regex string
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" ;
    //Create predicate with format matching your regex string
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    //return true if email address is valid
    return [emailTest evaluateWithObject:self];
    
}

- (BOOL)isStartsWithACapitalLetter {
    
    unichar firstCharacter = [self characterAtIndex:0];
    return [[NSCharacterSet uppercaseLetterCharacterSet]
            characterIsMember:firstCharacter];
    
}

#pragma mark -

- (NSString *)trimWhitespace {
    
    //    NSMutableString *str = [self mutableCopy];
    //    CFStringTrimWhitespace((__bridge CFMutableStringRef)str);
    //    return str;
    
    return [self stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSUInteger)numberOfWords {
    __block NSUInteger count = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords|NSStringEnumerationSubstringNotRequired
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              count++;
                          }];
    return count;
}

- (NSString *)reverseString {
    
    //    int len = [self length];
    //
    //    NSMutableString *reversedStr = [NSMutableString stringWithCapacity:len];
    //    while (len--) {
    //        [reversedStr appendFormat:@"%C", [self characterAtIndex:len]];
    //    }
    
    // New way
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0,[self length])
                             options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              [reversedString appendString:substring];
                          }];
    
    
    return reversedString;
}

- (NSString *)concat:(NSString *)string {
    
    if (!string) {
        return self;
    }
    
    return [NSString stringWithFormat:@"%@%@",self, string];
}

- (BOOL)contains:(NSString *)string {
    
    if (string) {
        NSRange range = [self rangeOfString:string];
        return (range.location != NSNotFound);
        
    }else {
        return NO;
    }
    
}


+ (NSString *)truncateString:(NSString *) string toCharacterCount:(NSUInteger) count {
    
    NSRange range = { 0, MIN(string.length, count) };
    range = [string rangeOfComposedCharacterSequencesForRange: range];
    NSString *trunc = [string substringWithRange: range];
    
    if (trunc.length < string.length) {
        trunc = [trunc stringByAppendingString: @"..."];
    }
    
    return trunc;
    
} // truncateString

#pragma mark - URL Encoding and Decoding
- (NSString *)urlEncode {
    return [self urlEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)stringUTF8Decode {
    return [self stringUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

#pragma mark - Date Format

- (NSDate *)dateFromFormat: (NSString *)formatter {
    
    //    debug(@"dateString %@",dateString);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [dateFormatter setDateFormat:formatter];
    
    NSDate *dateFromString = [dateFormatter dateFromString:self];
    return dateFromString;
}
+ (NSString *)getSmallImagestringFromString:(NSString *)str {
    NSArray *arr = [str componentsSeparatedByString:@"/"];
    NSMutableArray *marr = [NSMutableArray new];
    for (int i = 0; i < arr.count; i++) {
        if (i == arr.count - 1) {
            NSString *s = arr[i];
            NSString *newStr = [NSString stringWithFormat:@"thumb_%@", s];
            [marr addObject:newStr];
            break;
        }
        [marr addObject:arr[i]];
    }
    return [marr componentsJoinedByString:@"/"];
}
#pragma mark - Extension

+ (NSString *)imageBase64:(UIImage *)image
{
    image = [self imageWithImageSimple:image scaledToSize:CGSizeMake(200, 200)];
    
    NSData *data =[NSData data];
    if (UIImagePNGRepresentation(image)) {
        //返回为png图像。
        data = UIImagePNGRepresentation(image);
    }else {
        //返回为JPEG图像。
        data = UIImageJPEGRepresentation(image, 0.5);
    }
    NSString *base64ImageStr = [data base64EncodedStringWithOptions:0];
    base64ImageStr = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                   (CFStringRef)base64ImageStr,
                                                                                   NULL,
                                                                                   CFSTR("="),
                                                                                   kCFStringEncodingUTF8);
    return base64ImageStr;
}

/**
 *  调整发图片大小
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
}

/**
 *  返回单行文字大小
 *
 *  @param fontSize 字体大小
 */
- (CGSize)titleSizeWithfontSize:(CGFloat)fontSize
{
    return [self titleSizeWithfontSize:fontSize maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
}

/**
 *  返回文字大小
 *
 *  @param fontSize 字体大小
 */
- (CGSize)titleSizeWithfontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;
{
    CGSize size =   [self boundingRectWithSize:maxSize
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]}
                                       context:nil].size;
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}




/**
 *  根据时间戳字符串返回指定格式的年月日字符串
 *
 *  @param createTime 时间戳
 *
 *  @return 返回时间字符串
 */
+ (NSString *)nyrDateStringWithCreateTimeFromString:(NSString *)createTime
{
    if (createTime.length) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSDate *create_date = [NSDate dateWithTimeIntervalSince1970:[createTime longLongValue]];
        formatter.dateFormat = @"YYYY年MM月dd日";
        NSString *dateString = [formatter stringFromDate:create_date];
        
        return dateString;
    }
    return @"";
}

/**
 *  根据指定格式的年月日字符串返回时间戳字符串
 *
 *  @param nyrDateString 年月日时间字符串
 *
 *  @return 返回时间字符串
 */
+ (NSString *)createDateStringWithNYRDateString:(NSString *)nyrDateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY年MM月dd日"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    
    NSDate *date = [formatter dateFromString:nyrDateString];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp);
    return timeSp;
}



@end