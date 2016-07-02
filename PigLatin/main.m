//
//  main.m
//  PigLatin
//
//  Created by thomas minshull on 2016-07-01.
//  Copyright © 2016 thomas minshull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+pigLatin.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        InputCollector *inputCollector = [[InputCollector alloc] init];
        NSString *string = [inputCollector inputForPrompt:@"enter a string:"];
        NSLog(@"%@", [string stringByPigLatin]);
    }
    return 0;
}
