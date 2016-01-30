//
//  ViewController.m
//  GoldPlusSigma
//
//  Created by Hyuntae Byun on 1/29/16.
//  Copyright © 2016 Hyuntae Byun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.pagedScrollView.backgroundColor = [UIColor redColor];
    self.pagedScrollView.contentSize = CGSizeMake(320, 4200);
    self.pagedScrollView.pagingEnabled = YES;
    
    UIView *testView1 = [[UIView alloc] initWithFrame:CGRectMake(30, 50, 320, 10)];
    testView1.backgroundColor = [UIColor whiteColor];
    [self.pagedScrollView addSubview:testView1];
    
    UIView *testView2 = [[UIView alloc] initWithFrame:CGRectMake(30, 1000, 320, 10)];
    testView2.backgroundColor = [UIColor whiteColor];
    [self.pagedScrollView addSubview:testView2];
    
    UILabel *testLabel1 = [[UILabel alloc] init];
    testLabel1.text = @"Hello!!!!";
    testLabel1.frame = CGRectMake(30, 700, 90, 20);
    
    [self.pagedScrollView addSubview:testLabel1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end