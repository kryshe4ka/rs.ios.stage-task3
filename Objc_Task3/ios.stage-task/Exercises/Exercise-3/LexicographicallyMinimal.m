#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *str1 = [NSMutableString stringWithString:string1];
    NSMutableString *str2 = [NSMutableString stringWithString:string2];
    NSMutableString *resultStr = [NSMutableString stringWithString:@""];
    NSRange range = NSMakeRange(0, 1);
    
    
    while (!(str1.length == 0) && !(str2.length == 0)) {
        
        NSComparisonResult compareResult = [str1 compare:str2];
        NSLog(@"%li", (long)compareResult);
        
        if (compareResult == 1) {
            [resultStr appendString:[str2 substringWithRange:range]];
            [str2 deleteCharactersInRange:range];
        } else {
            [resultStr appendString:[str1 substringWithRange:range]];
            [str1 deleteCharactersInRange:range];
        }
        NSLog(@"%@", resultStr);
    }
    [resultStr appendString:str1];
    [resultStr appendString:str2];
    
    NSString *resultString = [NSString stringWithString:resultStr];
    
    return resultString;
}

@end
