//
//  ViewController.h
//  GoldPlusSigma
//
//  Created by Hyuntae Byun on 1/29/16.
//  Copyright © 2016 Hyuntae Byun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *pagedScrollView;

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@property (weak, nonatomic) IBOutlet UIButton *testButton;

@property (strong, nonatomic) GeneticAlgorithm *ga;

@end