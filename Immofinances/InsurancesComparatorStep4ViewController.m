//
//  InsurancesComparatorStep4ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 20/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "InsurancesComparatorStep4ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface InsurancesComparatorStep4ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeTextView;
@property (weak, nonatomic) IBOutlet UITextField *cityTextView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextView;
@property (weak, nonatomic) IBOutlet UITextField *emailTextView;
@property (weak, nonatomic) IBOutlet UIButton *validateButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;

@end

@implementation InsurancesComparatorStep4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
        
    [self.validateButton setImage:[UIImage imageNamed:@"ValidateButtonNormal"] forState:UIControlStateNormal];
    [self.validateButton setImage:[UIImage imageNamed:@"ValidateButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonNormal"] forState:UIControlStateNormal];
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
}

- (IBAction)showNextView:(id)sender {
    
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToInsurancesComparatorStep3View];
}

- (IBAction)returnToInsurancesComparatorStep3FromInsurancesComparatorStep4View:(id)sender {
    [self.delegate returnToInsurancesComparatorStep3View];
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
