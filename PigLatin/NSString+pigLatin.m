//
//  NSString+pigLatin.m
//  PigLatin
//
//  Created by thomas minshull on 2016-07-01.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import "NSString+pigLatin.h"

@implementation NSString (pigLatin)

- (NSString *)stringByPigLatin {
      NSString __block *returnString = @"";
    
    // Tokenize sSourceEntityName on both whitespace and punctuation.
    NSMutableCharacterSet *mcharsetWhitePunc = [[NSCharacterSet whitespaceAndNewlineCharacterSet] mutableCopy];
    [mcharsetWhitePunc formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    NSArray *sarrTokenizedString = [self componentsSeparatedByCharactersInSet:mcharsetWhitePunc];
    
    // seportate the first constants from the rest of the word
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aAeEiIoOuUY"]; // only sometimes Y :P
    NSCharacterSet *constants = [vowels invertedSet];
    
    for (NSString *word in sarrTokenizedString) { // line is word
            [word enumerateLinesUsingBlock:^(NSString *line, BOOL *stop) {
                NSScanner *scanner = [NSScanner scannerWithString:line];
                [scanner setCharactersToBeSkipped:vowels];
                
                NSString *leadingConstants;
                
                [scanner scanCharactersFromSet:constants intoString:&leadingConstants];
                
                NSRange restOfWordRange = NSMakeRange(leadingConstants.length, word.length-leadingConstants.length);
                NSString *restOfWord = [word substringWithRange:restOfWordRange];
                
//                NSLog(@"leadingConstants: %@", leadingConstants);
//                NSLog(@"restOfWord: %@", restOfWord);
//                
                // add these words to return string in pig-latin
                returnString = [returnString stringByAppendingString:restOfWord];
                returnString = [returnString stringByAppendingString:leadingConstants];
                returnString = [returnString stringByAppendingString:@"ly "];
            }];
        }
    return returnString;
}

@end
