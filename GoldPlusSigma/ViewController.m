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
    
    [self.testLabel setText: [ga.population objectAtIndex:0]];
    
    //[self.pagedScrollView addSubview:testLabel1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testAction {
    ga
}

@end
