//
//  NSString+Category.h
//
//
//  Created by beinie on 15/7/2.
//
//
#import <Foundation/Foundation.h>

@interface NSString (Category)

#pragma mark - Validations

- (BOOL)isNull ;

- (BOOL)isEmpty ;

- (BOOL)isEmail ;

- (BOOL)isStartsWithACapitalLetter;

#pragma mark -

- (NSString *)trimWhitespace ;

- (NSUInteger)numberOfWords ;

- (NSString *)reverseString ;

- (NSString *)concat:(NSString *)string ;

- (BOOL)contains:(NSString *)string ;

+ (NSString *)truncateString:(NSString *) string toCharacterCount:(NSUInteger) count ;

+ (NSString *)getSmallImagestringFromString:(NSString *)str;
#pragma mark - URL Encoding and Decoding

- (NSString *)urlEncode ;

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding ;

- (NSString *)stringUTF8Decode ;

- (NSString *)stringUsingEncoding:(NSStringEncoding)encoding ;

#pragma mark - Date Format

- (NSDate *)dateFromFormat: (NSString *)formatter ;

#pragma mark - Extension
/**
 *  将image进行base64编码
 */
+ (NSString *)imageBase64:(UIImage *)image;

/**
 *  返回单行文字大小
 *
 *  @param fontSize 字体大小
 */
- (CGSize)titleSizeWithfontSize:(CGFloat)fontSize;

/**
 *  返回文字大小
 *
 *  @param fontSize 字体大小
 */
- (CGSize)titleSizeWithfontSize:(CGFloat)fontSize maxSize:(CGSize)maxSize;

/**
 *  根据时间戳字符串返回指定格式的时间字符串
 *
 *  @param createTime 时间戳
 *
 *  @return 返回时间字符串
 */
+ (NSString *)dateStringWithCreateTimeFromString:(NSString *)createTime;

/**
 *  根据时间戳字符串返回指定格式的年月日字符串
 *
 *  @param createTime 时间戳
 *
 *  @return 返回时间字符串
 */
+ (NSString *)nyrDateStringWithCreateTimeFromString:(NSString *)createTime;

/**
 *  根据指定格式的年月日字符串返回时间戳字符串
 *
 *  @param nyrDateString 年月日时间字符串
 *
 *  @return 返回时间字符串
 */
+ (NSString *)createDateStringWithNYRDateString:(NSString *)nyrDateString;

@end

