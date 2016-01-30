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
    
    CGRect fullScreenRect = [[UIScreen mainScreen] bounds];
    
    self.pagedScrollView.backgroundColor = [UIColor redColor];
    self.pagedScrollView.contentSize = CGSizeMake(fullScreenRect.size.width, 4200);
    self.pagedScrollView.pagingEnabled = YES;
    
    //Sets up the test views for paging
    UIView *testView1 = [[UIView alloc] initWithFrame:CGRectMake(30, 50, 320, 10)];
    testView1.backgroundColor = [UIColor whiteColor];
    [self.pagedScrollView addSubview:testView1];
    
    UIView *testView2 = [[UIView alloc] initWithFrame:CGRectMake(30, 1000, 320, 10)];
    testView2.backgroundColor = [UIColor whiteColor];
    [self.pagedScrollView addSubview:testView2];
    
    //sets up test label with test "Hello!" Also demos the idea of setting fonts with sizes
    UILabel *testLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 400, 500)];
    testLabel1.numberOfLines = 0;
    testLabel1.text = @"Hello!!!!";
    [testLabel1 setFont:[UIFont fontWithName:@"Helvetica Nueue" size:29.0]];
    [testLabel1 sizeToFit];
    
    //sets up general animation system
    [self setUpAnimationForView:testLabel1];
    
    [self.pagedScrollView addSubview:testLabel1];
}

- (void) setUpAnimationForView:(UIView*)viewToAnimate {
    float animationDuration = 1.0;
    
    CATransition *applicationLoadViewIn = [CATransition animation];
    [applicationLoadViewIn setDuration:animationDuration];
    
    [applicationLoadViewIn setType:kCATransitionReveal];
    
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [[viewToAnimate layer] addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
