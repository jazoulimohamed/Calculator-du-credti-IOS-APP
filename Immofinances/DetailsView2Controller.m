//
//  DetailsView2ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "DetailsView2ViewController.h"

@interface DetailsView2ViewController ()

@end

@implementation DetailsView2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.closeButton.backgroundColor = UIColorFromRGB(0xCCCCCC);
}

- (IBAction)hideDetailsView1:(id)sender {
    [self.delegate hideDetailsView2];
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
