//
//  HomeViewController.m
//  Immofinances
//
//  Created by Aminowizc on 14/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "HomeViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (retain, nonatomic) SlideMenuViewController *slideMenuViewController;

@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UIView *transparentView2;
@property (retain, nonatomic) UIView *overlayView;
@property BOOL menuIsDisplayed;
@property float slideMenuWidth;
@property float slideMenuHeight;
@property (weak, nonatomic) IBOutlet UIView *buttonsView;
@property (weak, nonatomic) IBOutlet UISlider *rateSlider;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView1;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView2;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView3;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView4;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView5;
@property (weak, nonatomic) IBOutlet UILabel *intervalTextView6;

@property (weak, nonatomic) IBOutlet UIButton *monthlyPaymentsButton;
@property (weak, nonatomic) IBOutlet UIButton *borrowingCapacity;
@property (weak, nonatomic) IBOutlet UIButton *repaymentPeriodButton;
@property (weak, nonatomic) IBOutlet UIButton *barometerButton;
@property (weak, nonatomic) IBOutlet UIButton *notaryFeesButton;
@property (weak, nonatomic) IBOutlet UIButton *expressCreditButton;
@property (weak, nonatomic) IBOutlet UIButton *personalAreaButton;
@property (weak, nonatomic) IBOutlet UIButton *insurancesComparatorButton;
@property (weak, nonatomic) IBOutlet UIButton *detailsButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeleft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swiperight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swiperight:)];
    swiperight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swiperight];
    
    self.menuIsDisplayed = NO;
    
    //[self changeComponentsAppearence];
    [self initializeSlideMenu];
    [self initializeComponents];
}

- (void)initializeComponents {
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    self.transparentView2.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.0];
    self.detailsButton.backgroundColor = UIColorFromRGB(0xfd8355);
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
    
    [self.monthlyPaymentsButton setImage:[UIImage imageNamed:@"MonthlyPaymentsButtonNormal"] forState:UIControlStateNormal];
    [self.monthlyPaymentsButton setImage:[UIImage imageNamed:@"MonthlyPaymentsButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.borrowingCapacity setImage:[UIImage imageNamed:@"BorrowingCapacityButtonNormal"] forState:UIControlStateNormal];
    [self.borrowingCapacity setImage:[UIImage imageNamed:@"BorrowingCapacityButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.repaymentPeriodButton setImage:[UIImage imageNamed:@"RepaymentPeriodButtonNormal"] forState:UIControlStateNormal];
    [self.repaymentPeriodButton setImage:[UIImage imageNamed:@"RepaymentPeriodButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.barometerButton setImage:[UIImage imageNamed:@"BarometerButtonNormal"] forState:UIControlStateNormal];
    [self.barometerButton setImage:[UIImage imageNamed:@"BarometerButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];

    [self.notaryFeesButton setImage:[UIImage imageNamed:@"NotaryFeesButtonNormal"] forState:UIControlStateNormal];
    [self.notaryFeesButton setImage:[UIImage imageNamed:@"NotaryFeesButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.expressCreditButton setImage:[UIImage imageNamed:@"ExpressCreditButtonNormal"] forState:UIControlStateNormal];
    [self.expressCreditButton setImage:[UIImage imageNamed:@"ExpressCreditButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.personalAreaButton setImage:[UIImage imageNamed:@"PersonalAreaButtonNormal"] forState:UIControlStateNormal];
    [self.personalAreaButton setImage:[UIImage imageNamed:@"PersonalAreaButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.insurancesComparatorButton setImage:[UIImage imageNamed:@"InsurancesComparatorButtonNormal"] forState:UIControlStateNormal];
    [self.insurancesComparatorButton setImage:[UIImage imageNamed:@"InsurancesComparatorButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];

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
    } else if (sliderValue >= 9 && sliderValue < 12) {
        self.rateSlider.value = 11.0;
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
    } else if (sliderValue >= 12 && sliderValue < 15) {
        self.rateSlider.value = 14.0;
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
    } else if (sliderValue >= 15 && sliderValue < 19) {
        self.rateSlider.value = 18.0;
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
    } else if (sliderValue >= 19 && sliderValue < 23) {
        self.rateSlider.value = 21.0;
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
    } else if (sliderValue >= 23 && sliderValue <= 25) {
        self.rateSlider.value = 25.0;
        self.intervalTextView6.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
        self.intervalTextView1.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView2.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView3.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView4.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
        self.intervalTextView5.font = [UIFont fontWithName:@"HelveticaNeue" size:11];
    }
    NSLog(@"sliderValue2 = %f",sliderValue);
}

- (void)showView:(NSInteger)index {
    [self toggleMenu];
    switch (index) {
        case 0:
            [self.delegate showRateDetailsView];
            break;
        case 1:
            [self.delegate showMonthlyPaymentsView];
            break;
        case 2:
            [self.delegate showBorrowingCapacityView];
            break;
        case 3:
            [self.delegate showRepaymentDurationView];
            break;
        case 4:
            [self.delegate showBarometerView];
            break;
        case 5:
            [self.delegate showNotaryFeesView];
            break;
        case 6:
            [self.delegate showPersonalAreaView];
            break;
        case 7:
            [self.delegate showExpressCreditStep1View];
            break;
        case 8:
            [self.delegate showInsurancesComparatorStep1View];
            break;
        case 9:
            [self.delegate showContactView];
            break;
        case 10:
            [self.delegate showNowsView];
            break;
        case 11:
            //[self.delegate showVideoPresentationView];
            break;
        default:
            break;
    }
}

- (IBAction)showDetailsView:(id)sender {
    [self.delegate showRateDetailsView];
}

- (IBAction)showMonthlyPaymentsView:(id)sender {
    [self.delegate showMonthlyPaymentsView];
}

- (IBAction)showBorrowingCapacityView:(id)sender {
    [self.delegate showBorrowingCapacityView];
}

- (IBAction)showRepaymentDurationView:(id)sender {
    [self.delegate showRepaymentDurationView];
}

- (IBAction)showBarometerView:(id)sender {
    [self.delegate showBarometerView];
}

- (IBAction)showNotaryFeesView:(id)sender {
    [self.delegate showNotaryFeesView];
}

- (IBAction)showExpressCreditView:(id)sender {
    [self.delegate showExpressCreditStep1View];
}

- (IBAction)showPersonalAreaView:(id)sender {
    [self.delegate showPersonalAreaView];
}

- (IBAction)showInsurancesComparatorView:(id)sender {
    [self.delegate showInsurancesComparatorStep1View];
}

- (void)swipeleft:(UISwipeGestureRecognizer*)gestureRecognizer {
    //Do what you want here
}

- (void)swiperight:(UISwipeGestureRecognizer*)gestureRecognizer {
    //Do what you want here
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initializeSlideMenu];
}

- (void)initializeSlideMenu {
    self.slideMenuViewController = [[SlideMenuViewController alloc] initWithNibName:@"SlideMenuView" bundle:nil];
    self.slideMenuViewController.delegate = self;
    self.slideMenuWidth = self.view.frame.size.width * 3 / 4;
    self.slideMenuHeight = self.view.frame.size.height - 90;
    
    //NSLog(@"slideMenuWidth %f %f", self.slideMenuWidth, self.slideMenuHeight);
    self.slideMenuViewController.view.frame = CGRectMake(0.0f, 90.0f, -self.slideMenuWidth, self.slideMenuHeight);
    //NSLog(@"initializeSlideMenu");
}

- (IBAction)toogleMenu:(id)sender {
    if (self.menuIsDisplayed) {
        [self hideSlideMenu];
        self.menuIsDisplayed = NO;
    } else {
        [self showSlideMenu];
        self.menuIsDisplayed = YES;
    }
}

- (void)toggleMenu {
    if (self.menuIsDisplayed) {
        [self hideSlideMenu];
        self.menuIsDisplayed = NO;
    } else {
        [self showSlideMenu];
        self.menuIsDisplayed = YES;
    }
}

- (void)showSlideMenu {
    [self showOverlayView];
    [self.view addSubview:self.slideMenuViewController.view];
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.slideMenuViewController.view.frame = CGRectMake(0.0f, 90.0f, self.slideMenuWidth, self.slideMenuHeight);
    }];
}

- (void)hideSlideMenu {
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.slideMenuViewController.view.frame = CGRectMake(0.0f, 90.0f, -self.slideMenuWidth, self.slideMenuHeight);
    } completion:^(BOOL finished){
        [self.slideMenuViewController.view removeFromSuperview];
    }];
    [self hideOverlayView];
}

- (void)showOverlayView {
    self.overlayView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 70.0f, self.view.frame.size.width, self.view.frame.size.height - 70.0f)];
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTap:)];
    [self.overlayView addGestureRecognizer:singleFingerTap];
    
    [self.overlayView setBackgroundColor:UIColorFromRGB(0x333333)];
    self.overlayView.layer.opacity = 0.2;
    [self.view addSubview:self.overlayView];
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.overlayView.alpha = 0.6;
    }];
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    //CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    [self toggleMenu];
    //Do stuff here...
}

- (void)hideOverlayView {
    [UIView animateWithDuration:0.3 animations:^(void) {
        self.overlayView.alpha = 0;
    } completion:^(BOOL finished){
        [self.overlayView removeFromSuperview];
    }];
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
