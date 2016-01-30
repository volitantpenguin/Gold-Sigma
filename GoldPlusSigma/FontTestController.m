//
//  FontTestController.m
//  GoldPlusSigma
//
//  Created by Hyuntae Byun on 1/30/16.
//  Copyright © 2016 Hyuntae Byun. All rights reserved.
//

#import "FontTestController.h"

@interface FontTestController ()

@end

@implementation FontTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *promptLabel = [[UILabel alloc] init];
    promptLabel.text = @"Select the font that you prefer.";
    promptLabel.font = [UIFont systemFontOfSize:25.0];
    promptLabel.numberOfLines = 0;
    [promptLabel sizeToFit];
    
    CGRect fullScreenRect = [self.selectionView bounds];
    CGRect topHalf = CGRectMake(fullScreenRect.origin.x, fullScreenRect.origin.y + promptLabel.frame.size.height, fullScreenRect.size.width, (fullScreenRect.size.height - promptLabel.frame.size.height)/2);
    CGRect bottomHalf = CGRectMake(fullScreenRect.origin.x, (fullScreenRect.origin.y + promptLabel.frame.size.height)/2, fullScreenRect.size.width, (fullScreenRect.origin.y + promptLabel.frame.size.height)/2);
    
    UIButton *topButton = [[UIButton alloc] initWithFrame:topHalf];
    
    UIButton *bottomButton = [[UIButton alloc] initWithFrame:bottomHalf];
    
    self.selectionView.backgroundColor = [UIColor redColor];
    
    
}

- (void) didSelectAButton:(int)buttonNumber {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end