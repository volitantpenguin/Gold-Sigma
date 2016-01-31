//
//  GeneticAlgorithm.m
//  GoldPlusSigma
//
//  Created by Edward Zhang on 1/29/16.
//  Copyright © 2016 Hyuntae Byun. All rights reserved.
//

#import "GeneticAlgorithm.h"

@implementation GeneticAlgorithm

-(void)initializePopulation {
    self.population = [[NSMutableArray alloc] init];
    self.testString = [[NSMutableString alloc] initWithString:@"HelloWorld"];
    self.letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    for (int i = 0; i < 10; i ++) {
        NSMutableString *string = nil;
        string = [self generateRandomString: 10];
        [self.population insertObject:string atIndex:i];
    }
}

// Generates alpha-numeric-random string
- (NSMutableString *)generateRandomString:(int)len {

    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i = 0; i < len; i ++) {
        int randInt = arc4random() % [self.letters length];
        [randomString appendFormat: @"%C", [self.letters characterAtIndex: randInt]];
    }
    return randomString;
}

- (int) calculateFitness:(NSMutableString *) specimen {
    int fitness = 0;
    
    for (int i = 0; i < [specimen length]; i ++) {
        unichar specimenChar = [self.testString characterAtIndex: i];
        unichar testChar = [specimen characterAtIndex:i];
        
        if (specimenChar == testChar)
            fitness ++;
    }
    return fitness;
}

- (NSMutableArray *)calculatePopulationFitness {
    
    NSMutableArray *fitnesses = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.population count]; i ++) {
        NSMutableString *specimen = [self.population objectAtIndex:i];
        int fitness = [self calculateFitness:specimen];
        //NSLog(@"%d", fitness);
        [fitnesses insertObject: [NSNumber numberWithInt:fitness] atIndex:i];
        //NSLog(@"god dammit");
    }
    return fitnesses;
}

- (NSMutableString *)crossString:(NSMutableString *)str1 withString:(NSMutableString *)str2 {
    NSMutableString *childString = [[NSMutableString alloc] initWithCapacity:[str1 length]];
    
    for (int i = 0; i < str1.length; i ++)
    {
        if (arc4random() % 2 == 0)
        {
            [childString appendFormat: @"%c", [str1 characterAtIndex: i]];
        }
        else
        {
            [childString appendFormat: @"%c", [str2 characterAtIndex: i]];
        }
    }
    NSLog(@"%@", childString);
    return childString;
}

- (NSMutableArray *) mutations {
    return nil;
}

@end
