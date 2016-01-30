//
//  TestThingy.h
//  GoldPlusSigma
//
//  Created by Edward Zhang on 1/29/16.
//  Copyright © 2016 Hyuntae Byun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeneticAlgorithm : NSObject

@property (strong, nonatomic) NSMutableString *testString;

@property (strong, nonatomic) NSMutableArray *population;

@property (strong, nonatomic) NSString *letters;

-(void)initializePopulation;

@end
