//
//  DBValidationNumberRangeRule.m
//  DBValidator
//
/* @author daniel beard
 * http://danielbeard.wordpress.com
 * http://github.com/daniel-beard
 *
 * Copyright (C) 2013 Daniel Beard
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#import "DBValidationNumberRangeRule.h"

@interface DBValidationNumberRangeRule ()

@property (nonatomic, assign) double minValue;
@property (nonatomic, assign) double maxValue;

@end

@implementation DBValidationNumberRangeRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath minNumberValue:(double)minValue maxNumberValue:(double)maxValue failureMessage:(NSString *)failureMessage {
    
    if (self = [super initWithObject:object keyPath:keyPath failureMessage:failureMessage]) {
        self.minValue = minValue;
        self.maxValue = maxValue;
    }
    return self;
}

-(BOOL) passesValidation {
    
    if (self.object == nil || self.keyPath == nil) [NSException raise:@"Object or keypath is nil" format:@"Object and keypath must have a non-nil value"];
    
    double numberValue = [[self.object valueForKey:self.keyPath] doubleValue];
    
    if (numberValue < self.minValue) return NO;
    if (numberValue > self.maxValue) return NO;
    
    return YES;
}

@end
