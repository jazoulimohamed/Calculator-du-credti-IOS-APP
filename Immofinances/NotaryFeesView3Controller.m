//
//  NotaryFeesView3Controller.m
//  Immofinances
//
//  Created by Aminowizc on 13/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "NotaryFeesView3Controller.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface NotaryFeesView3Controller ()

@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (retain, nonatomic) UIView *view1;
@property (nonatomic) float lastAmountStep;
@property (nonatomic) float amountStepValue;

@end

@implementation NotaryFeesView3Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.amountStepValue = 5000.0f;
    // Set the initial value to prevent any weird inconsistencies.
    self.lastAmountStep = 150000 / self.amountStepValue;
    [self initializeComponents];
}

- (void)initializeComponents {
    self.view.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.0];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.0];
    
    [self.slider1 setTintColor:UIColorFromRGB(0x3A423E)];
    [self.slider1 setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.slider1.minimumValue = 20000.0;
    self.slider1.maximumValue = 200000.0;
    self.slider1.value = 50000.0;
    [self.slider1 addTarget:self action:@selector(slider1Changed:) forControlEvents:UIControlEventValueChanged];
    [self.slider1 addTarget:self
                     action:@selector(slider1FinishedTouch:)
           forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    
    [self.slider2 setTintColor:UIColorFromRGB(0x3A423E)];
    [self.slider2 setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.slider2.minimumValue = 200000.0;
    self.slider2.maximumValue = 500000.0;
    self.slider2.value = 100000.0;
    [self.slider2 addTarget:self action:@selector(slider2Changed:) forControlEvents:UIControlEventValueChanged];
    [self.slider2 addTarget:self
                     action:@selector(slider2FinishedTouch:)
           forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    
    self.totalTextField1.enabled = NO;
    [self.totalTextField1 setBorderStyle:UITextBorderStyleNone];
    [self.totalTextField1 setBackgroundColor:[UIColor whiteColor]];
    [self.totalTextField1.layer setCornerRadius:10.0f];
    [self.totalTextField1.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.totalTextField1.layer setBorderWidth:1];
    
    self.totalTextField2.enabled = NO;
    [self.totalTextField2 setBorderStyle:UITextBorderStyleNone];
    [self.totalTextField2 setBackgroundColor:[UIColor whiteColor]];
    [self.totalTextField2.layer setCornerRadius:10.0f];
    [self.totalTextField2.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [self.totalTextField2.layer setBorderWidth:1];
}

- (void)slider1Changed:(UISlider *)slider {
    float newStep = roundf((self.slider1.value) / self.amountStepValue);
    
    // Convert "steps" back to the context of the sliders values.
    self.slider1.value = newStep * self.amountStepValue;
    NSLog(@"newStep = %f", newStep);
    
    float sliderValue = (float)(self.slider1.value);
    NSLog(@"sliderValue = %f",sliderValue);
    [self.textField1 setText:[NSString stringWithFormat:@"%d", (int)sliderValue]];
}

- (void)slider1FinishedTouch:(NSNotification *)notification {
    float sliderValue = (float)(self.slider1.value);
    NSLog(@"sliderValue2 = %f",sliderValue);
    [self.delegate estimateTotalValue];
}

- (void)slider2Changed:(UISlider *)slider {
    float newStep = roundf((self.slider2.value) / self.amountStepValue);
    
    // Convert "steps" back to the context of the sliders values.
    self.slider2.value = newStep * self.amountStepValue;
    NSLog(@"newStep = %f", newStep);
    
    float sliderValue = (float)(self.slider2.value);
    NSLog(@"sliderValue = %f",sliderValue);
    [self.textField2 setText:[NSString stringWithFormat:@"%d", (int)sliderValue]];
}

- (void)slider2FinishedTouch:(NSNotification *)notification {
    float sliderValue = (float)(self.slider2.value);
    NSLog(@"sliderValue2 = %f",sliderValue);
    [self.delegate estimateTotalValue];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([self.textField1 isFirstResponder] && [touch view] != self.textField1) {
        [self.textField1 resignFirstResponder];
        [self.delegate estimateTotalValue];
        NSLog(@"Touch EditText 1");
    } else if ([self.textField2 isFirstResponder] && [touch view] != self.textField2) {
        [self.textField2 resignFirstResponder];
        [self.delegate estimateTotalValue];
        NSLog(@"Touch EditText 2");
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)showSelectProjectPickerView:(id)sender {
    NSLog(@"dsds");
    [self.delegate showPickerView2];
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
