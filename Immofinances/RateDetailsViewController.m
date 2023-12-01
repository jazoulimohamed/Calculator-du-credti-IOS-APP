//
//  RateDetailsViewController.m
//  Immofinances
//
//  Created by Aminowizc on 17/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "RateDetailsViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface RateDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIView *toobarView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView1;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView2;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView3;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView4;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView5;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView6;
@property (weak, nonatomic) IBOutlet UIButton *calculationMethods;
@property (weak, nonatomic) IBOutlet UILabel *lowRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *stableRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowRateDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *averageRateDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *stableRateDescriptionLabel;
@property (retain, nonatomic) RateExplanationViewController *rateExplanationViewController;

@end

@implementation RateDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initializeComponents];
    [self setInitialValues:@"12"];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    self.calculationMethods.backgroundColor = UIColorFromRGB(0xfd8355);
    self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    // Amount slider
    [self.rateSlider setTintColor:UIColorFromRGB(0x3A423E)];
    [self.rateSlider setThumbTintColor:UIColorFromRGB(0xfd8355)];
    self.rateSlider.minimumValue = 7.0;
    self.rateSlider.maximumValue = 25.0;
    self.rateSlider.value = 14.0;
    /*[self.rateSlider addTarget:self action:@selector(rateSliderChanged:) forControlEvents:UIControlEventValueChanged];*/
    [self.rateSlider addTarget:self
                        action:@selector(rateSliderFinishedTouch:)
              forControlEvents:(UIControlEventTouchUpInside | UIControlEventTouchUpOutside)];
    
}

- (void)setInitialValues:(NSString*) value {
    self.lowRateLabel.text = [self.lowValues objectForKey:value];
    self.averageRateLabel.text = [self.averageValues objectForKey:value];
    self.stableRateLabel.text = [self.hightValues objectForKey:value];
    self.lowRateDescriptionLabel.text = [NSString stringWithFormat: @"1. Taux le plus bas hors assurance région %@", [self.lowRegionsValues objectForKey:value]];
    self.averageRateDescriptionLabel.text = @"2. Taux moyen hors assurance.";
    self.stableRateDescriptionLabel.text = @"3. Taux hors assurance du marché.";
}


- (void)rateSliderFinishedTouch:(NSNotification *)notification {
    float sliderValue = (float)(self.rateSlider.value);
    if (sliderValue < 9) {
        self.rateSlider.value = 7.0;
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        [self setInitialValues:@"7"];
    } else if (sliderValue >= 9 && sliderValue < 12) {
        self.rateSlider.value = 11.0;
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        [self setInitialValues:@"10"];
    } else if (sliderValue >= 12 && sliderValue < 15) {
        self.rateSlider.value = 14.0;
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        [self setInitialValues:@"12"];
    } else if (sliderValue >= 15 && sliderValue < 19) {
        self.rateSlider.value = 18.0;
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        [self setInitialValues:@"15"];
    } else if (sliderValue >= 19 && sliderValue < 23) {
        self.rateSlider.value = 21.0;
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        [self setInitialValues:@"20"];
    } else if (sliderValue >= 23 && sliderValue <= 25) {
        self.rateSlider.value = 25.0;
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        [self setInitialValues:@"25"];
    }
    NSLog(@"sliderValue2 = %f",sliderValue);
}

- (IBAction)showCalculatinMethodsView:(id)sender {
    self.rateExplanationViewController = [[RateExplanationViewController alloc] initWithNibName:@"RateExplanationView" bundle:nil];
    self.rateExplanationViewController.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.rateExplanationViewController.view.bounds.size.height);
    self.rateExplanationViewController.delegate = self;
    
    [UIView animateWithDuration:0.30 animations:^{
        [self.rateExplanationViewController.view setFrame:CGRectMake(0, self.view.bounds.size.height - self.rateExplanationViewController.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        [self.view addSubview:self.rateExplanationViewController.view];
    }];
}

- (void)hideRateExplanationView {
    [UIView animateWithDuration:0.30 animations:^{
        self.rateExplanationViewController.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.rateExplanationViewController.view.bounds.size.height);
    } completion:^(BOOL finished){ [self.rateExplanationViewController.view removeFromSuperview]; }];
}

- (IBAction)returnToHomeViewFromRateDetailsView:(id)sender {
    [self.delegate returnToHomeViewFromRateDetailsView];
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
