//
//  MonthlyPaymentViewController.m
//  Immofinances
//
//  Created by Aminowizc on 06/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "MonthlyPaymentViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface MonthlyPaymentViewController ()

@property (weak, nonatomic) IBOutlet UIView *toobarView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UISlider *amountSlider;
@property (weak, nonatomic) IBOutlet UISlider *durationSlider;
@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *durationTextField;
@property (weak, nonatomic) IBOutlet UITextField *rateTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;

@property (nonatomic) float lastAmountStep;
@property (nonatomic) float amountStepValue;

@end

@implementation MonthlyPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.amountStepValue = 5000.0f;
    // Set the initial value to prevent any weird inconsistencies.
    self.lastAmountStep = 150000 / self.amountStepValue;
    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    // Amount slider
    [self.amountSlider setTintColor:UIColorFromRGB(0x3A423E)];
    [self.amountSlider setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.amountSlider.minimumValue = 15000.0;
    self.amountSlider.maximumValue = 500000.0;
    self.amountSlider.value = 150000.0;
    [self.amountSlider addTarget:self action:@selector(amountSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.amountSlider addTarget:self
                  action:@selector(amountSliderFinishedTouch:)
        forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    
    // Duration slider
    [self.durationSlider setTintColor:UIColorFromRGB(0x3A423E)];
    [self.durationSlider setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.durationSlider.minimumValue = 7;
    self.durationSlider.maximumValue = 40;
    self.durationSlider.value = 15;
    [self.durationSlider addTarget:self action:@selector(durationSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.durationSlider addTarget:self
                          action:@selector(durationSliderFinishedTouch:)
                forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    
    // Rate slider
    [self.rateSlider setTintColor:UIColorFromRGB(0x3A423E)];
    [self.rateSlider setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.rateSlider.minimumValue = 0;
    self.rateSlider.maximumValue = 1000;
    self.rateSlider.value = 75;
    [self.rateSlider addTarget:self action:@selector(rateSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.rateSlider addTarget:self
                            action:@selector(rateSliderFinishedTouch:)
                  forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    
    self.amountTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.durationTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.rateTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.totalTextField.enabled = NO;
    [self.totalTextField setBorderStyle:UITextBorderStyleNone];
    [self.totalTextField setBackgroundColor:[UIColor whiteColor]];
    [self.totalTextField.layer setCornerRadius:10.0f];
    [self.totalTextField.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.totalTextField.layer setBorderWidth:1];
}

- (void)amountSliderChanged:(UISlider *)slider {
    float newStep = roundf((self.amountSlider.value) / self.amountStepValue);
    
    // Convert "steps" back to the context of the sliders values.
    self.amountSlider.value = newStep * self.amountStepValue;
    NSLog(@"newStep = %f", newStep);
    
    float sliderValue = (float)(self.amountSlider.value);
    NSLog(@"sliderValue = %f",sliderValue);
    [self.amountTextField setText:[NSString stringWithFormat:@"%d", (int)sliderValue]];
}

- (void)amountSliderFinishedTouch:(NSNotification *)notification {
    float sliderValue = (float)(self.amountSlider.value);
    NSLog(@"sliderValue2 = %f",sliderValue);
    [self evaluateTotal];
}

- (void)durationSliderChanged:(UISlider *)slider {
    int sliderValue = self.durationSlider.value;
    NSLog(@"sliderValue = %d",sliderValue);
    [self.durationTextField setText:[NSString stringWithFormat:@"%d", sliderValue]];
}

- (void)durationSliderFinishedTouch:(NSNotification *)notification {
    float sliderValue = (float)(self.durationSlider.value);
    NSLog(@"sliderValue2 = %f",sliderValue);
    [self evaluateTotal];
}

- (void)rateSliderChanged:(UISlider *)slider {
    float sliderValue = floorf((self.rateSlider.value * 0.01) * 100 + 0.5) / 100;
    NSLog(@"sliderValue = %f",sliderValue);
    [self.rateTextField setText:[NSString stringWithFormat:@"%.2f", sliderValue]];
}

- (void)rateSliderFinishedTouch:(NSNotification *)notification {
    float sliderValue = floorf((self.rateSlider.value * 0.01) * 100 + 0.5) / 100;
    NSLog(@"sliderValue2 = %f",sliderValue);
    [self evaluateTotal];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([self.amountTextField isFirstResponder] && [touch view] != self.amountTextField) {
        [self.amountTextField resignFirstResponder];
        [self evaluateTotal];
        NSLog(@"Touch EditText 1");
    } else if ([self.durationTextField isFirstResponder] && [touch view] != self.durationTextField) {
        [self.durationTextField resignFirstResponder];
        [self evaluateTotal];
        NSLog(@"Touch EditText 2");
    } else if ([self.rateTextField isFirstResponder] && [touch view] != self.rateTextField) {
        [self.rateTextField resignFirstResponder];
        [self evaluateTotal];
        NSLog(@"Touch EditText 3");
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)evaluateTotal {
    NSString *amountStr = self.amountTextField.text;
    NSString *durationStr = self.durationTextField.text;
    NSString *rateStr = self.rateTextField.text;
    
    double borrowedAmount = [amountStr doubleValue];
    double borrowDuration = [durationStr doubleValue];
    double interestRate = [rateStr doubleValue];
    
    NSString *error = @"";
    if (borrowedAmount <= 0) {
        error = @"Précisez le montant que vous souhaitez emprunter !";
    } else if((borrowDuration <= 0 || borrowDuration > 40)) {
        error = @"Précisez la durée de remboursement souhaitée (40 ans maximum) !";
    } else if(interestRate <= 0 || interestRate > 20) {
        error = @"Saisissez le taux du prêt !";
    }
    
    if ([error isEqualToString:@""]) {
        double t;
        double n = borrowDuration * 12;
        if(interestRate != 0) {
            t = interestRate / 1200;
            t = (t / (1 - pow(1 + t, - n)));
        } else {
            t = 1 / n;
        }
        double mensuality  = ((borrowedAmount * t) * 100) / 100;
        [self.totalTextField setText:[NSString stringWithFormat:@"%.2f", mensuality]];
    } else {
        [self showMessage:error withTitle:@"Erreur"];
    }
}

- (void)showMessage:(NSString*)message withTitle:(NSString *)title {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (IBAction)returnToHomeViewFromMonthlyPaymentView:(id)sender {
    [self.delegate returnToHomeViewFromMonthlyPaymentView];
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
