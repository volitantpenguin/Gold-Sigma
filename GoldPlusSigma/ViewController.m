//
//  ViewController.m
//  GoldPlusSigma
//
//  Created by Hyuntae Byun on 1/29/16.
//  Copyright © 2016 Hyuntae Byun. All rights reserved.
//

#import "ViewController.h"
#import "GeneticAlgorithm.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.generation = 0;
    self.ga = [[GeneticAlgorithm alloc] init];
    [self.ga initializePopulation];
    
    CGRect fullScreenRect = [[UIScreen mainScreen] bounds];
    
    self.pagedScrollView.backgroundColor = [UIColor redColor];
    self.pagedScrollView.contentSize = CGSizeMake(fullScreenRect.size.width, 4200);
    self.pagedScrollView.pagingEnabled = YES;
    
    //Sets up the test views for paging
    UIView *testView1 = [[UIView alloc] initWithFrame:CGRectMake(30, 50, 320, 10)];
    testView1.backgroundColor = [UIColor blueColor];
    [self.pagedScrollView addSubview:testView1];
    
    UIView *testView2 = [[UIView alloc] initWithFrame:CGRectMake(30, 1000, 320, 10)];
    testView2.backgroundColor = [UIColor whiteColor];
    [self.pagedScrollView addSubview:testView2];

    [self.testLabel setText: [self.ga.population objectAtIndex:0]];
    //[self.pagedScrollView addSubview:testLabel1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction {
    NSMutableArray *fitnesses = [[NSMutableArray alloc] init];
    NSMutableArray *survivors = [[NSMutableArray alloc] init];
    fitnesses = [self.ga calculatePopulationFitness];
    
    for (int i = 0; i < [fitnesses count]; i ++) {
        [survivors addObject:[NSNumber numberWithInt:0]];
    }


    for (int i = 0; i < [fitnesses count]; i ++)
    {
        NSNumber *index = [NSNumber numberWithInt:i];
        int fitness = (int)[[fitnesses objectAtIndex:i] integerValue];
        
        //NSLog(@"%d", fitness);
        
        int j = 0;
        BOOL done = false;
        while (j < [survivors count] && !done)
        {
            NSLog(@"%d", fitness);
            if (fitness >= [[survivors objectAtIndex:i] integerValue]) {
                [survivors insertObject:index atIndex:j];
                NSLog(@"String: %@", [self.ga.population objectAtIndex:[[survivors objectAtIndex:j] integerValue]]);
                done = true;
            }
            j ++;
        }
    }
    
    NSLog(@"%@", [survivors objectAtIndex:0]);
    NSLog(@"%@", [self.ga.population objectAtIndex:[[survivors objectAtIndex:0] integerValue]]);
    
    NSMutableArray *newPopulation = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 5; i ++) {
        for (int j = 1; j <= 5; j ++) {
            NSMutableString *str1 = [self.ga.population objectAtIndex:[[survivors objectAtIndex:i] integerValue]];
            NSMutableString *str2 = [self.ga.population objectAtIndex:[[survivors objectAtIndex:j] integerValue]];
            [newPopulation addObject:[self.ga crossString:str1 withString:str2]];
        }
    }
    self.ga.population = newPopulation;
    self.generation ++;
    NSLog(@"%d", self.generation);
}

@end
