//
//  RepaymentPeriodViewController.m
//  Immofinances
//
//  Created by Aminowizc on 07/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "RepaymentPeriodViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface RepaymentPeriodViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UISlider *amountSlider;
@property (weak, nonatomic) IBOutlet UISlider *monthlyAmountSlider;
@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UITextField *monthlyAmountTextField;
@property (weak, nonatomic) IBOutlet UITextField *rateTextField;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField;

@property (nonatomic) float lastAmountStep;
@property (nonatomic) float amountStepValue;
@property (nonatomic) float lastMonthlyAmountStep;
@property (nonatomic) float monthlyAmountStepValue;

@end

@implementation RepaymentPeriodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.amountStepValue = 5000.0f;
    // Set the initial value to prevent any weird inconsistencies.
    self.lastAmountStep = 150000 / self.amountStepValue;
    
    
    self.monthlyAmountStepValue = 100.0f;
    self.lastMonthlyAmountStep = 750.0f / self.monthlyAmountStepValue;;
    
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
    [self.monthlyAmountSlider setTintColor:UIColorFromRGB(0x3A423E)];
    [self.monthlyAmountSlider setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.monthlyAmountSlider.minimumValue = 200.0;
    self.monthlyAmountSlider.maximumValue = 1500.0;
    self.monthlyAmountSlider.value = 200;
    [self.monthlyAmountSlider addTarget:self action:@selector(monthlyAmountSliderChanged:) forControlEvents:UIControlEventValueChanged];
    [self.monthlyAmountSlider addTarget:self
                            action:@selector(monthlyAmountSliderFinishedTouch:)
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
    self.monthlyAmountTextField.keyboardType = UIKeyboardTypeNumberPad;
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
    [self evaluateTotal];
    NSLog(@"sliderValue2 = %f",sliderValue);
}

- (void)monthlyAmountSliderChanged:(UISlider *)slider {
    float newStep = roundf((self.monthlyAmountSlider.value) / self.monthlyAmountStepValue);
    
    // Convert "steps" back to the context of the sliders values.
    self.monthlyAmountSlider.value = newStep * self.monthlyAmountStepValue;
    NSLog(@"newStep = %f", newStep);
    
    float sliderValue = (float)(self.monthlyAmountSlider.value);
    NSLog(@"sliderValue = %f",sliderValue);
    [self.monthlyAmountTextField setText:[NSString stringWithFormat:@"%d", (int)sliderValue]];
}

- (void)monthlyAmountSliderFinishedTouch:(NSNotification *)notification {
    float sliderValue = (float)(self.monthlyAmountSlider.value);
    [self evaluateTotal];
    NSLog(@"sliderValue2 = %f",sliderValue);
}

- (void)rateSliderChanged:(UISlider *)slider {
    float sliderValue = floorf((self.rateSlider.value * 0.01) * 100 + 0.5) / 100;
    NSLog(@"sliderValue = %f",sliderValue);
    [self.rateTextField setText:[NSString stringWithFormat:@"%.2f", sliderValue]];
}

- (void)rateSliderFinishedTouch:(NSNotification *)notification {
    float sliderValue = floorf((self.rateSlider.value * 0.01) * 100 + 0.5) / 100;
    [self evaluateTotal];
    NSLog(@"sliderValue2 = %f",sliderValue);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([self.amountTextField isFirstResponder] && [touch view] != self.amountTextField) {
        [self.amountTextField resignFirstResponder];
        [self evaluateTotal];
        NSLog(@"Touch EditText 1");
    } else if ([self.monthlyAmountTextField isFirstResponder] && [touch view] != self.monthlyAmountTextField) {
        [self.monthlyAmountTextField resignFirstResponder];
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
    NSString *monthlyAmountStr = self.monthlyAmountTextField.text;
    NSString *rateStr = self.rateTextField.text;
    
    double borrowedAmount = [amountStr doubleValue];
    double monthlyAmount = [monthlyAmountStr doubleValue];
    double interestRate = [rateStr doubleValue];
    
    NSString *error = @"";
    if (borrowedAmount <= 0) {
        error = @"Précisez le montant que vous souhaitez emprunter !";
    } else if (monthlyAmount <= 0) {
        error = @"Précisez le montant de la mensualité souhaitée !";
    } else if (interestRate <= 0 || interestRate > 20) {
        error = @"Saisissez le taux du prêt !";
    }
    
    if ([error isEqualToString:@""]) {
        double n;
        double t = interestRate / 1200;
        double nMax = 40 * 12;
        if (t == 0) {
            t = monthlyAmount / borrowedAmount;
            n = floor(t);
            if (t-n > 0.001) n++;
        } else if (monthlyAmount <= (borrowedAmount * t)) {
            n = nMax+1;
        } else {
            double crd = borrowedAmount;
            for(n = 1; n <= nMax; n++) {
                crd -= monthlyAmount - (crd * t);
                if (crd < monthlyAmount / 1000) break;
            }
        }
        if (n > nMax) {
            NSString *s;
            s = @"la durée de remboursement excède 40 ans !\n(votre mensualité est trop faible).";
            [self showMessage:s withTitle:@"Erreur"];
        } else {
            double NbAn = floor(n / 12);
            NSString *duration = @"";
            duration = [NSString stringWithFormat:@"%.0f ans", NbAn];
            n -= (12 * NbAn);
            if (n > 0) duration = [NSString stringWithFormat:@"%@ et %.0f mois", duration, n];
            [self.totalTextField setText:duration];
        }
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

- (IBAction)returnToHomeViewFromRepaymentPeriodView:(id)sender {
    [self.delegate returnToHomeViewFromRepaymentPeriodView];
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
