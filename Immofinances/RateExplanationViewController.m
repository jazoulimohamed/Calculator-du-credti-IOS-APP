//
//  RateExplanationViewController.m
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "RateExplanationViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface RateExplanationViewController ()

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation RateExplanationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.closeButton.backgroundColor = UIColorFromRGB(0xCCCCCC);
}

- (IBAction)hideRateExplanationView:(id)sender {
    [self.delegate hideRateExplanationView];
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
