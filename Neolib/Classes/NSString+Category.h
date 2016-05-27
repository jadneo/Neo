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


@end

