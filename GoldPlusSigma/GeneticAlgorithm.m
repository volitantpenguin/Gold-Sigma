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
        string = [self generateRandomString: 20];
        [self.population addObject:string];
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
        [fitnesses insertObject: [NSNumber numberWithInt:fitness] atIndex:i];
    }
    return fitnesses;
}

@end
