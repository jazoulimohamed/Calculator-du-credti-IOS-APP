//
//  InsurancesComparatorStep2ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 20/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "InsurancesComparatorStep2ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface InsurancesComparatorStep2ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UIButton *situationButton;
@property (weak, nonatomic) IBOutlet UIButton *quotityButton;
@property (weak, nonatomic) IBOutlet UIButton *riskButton;
@property (weak, nonatomic) IBOutlet UIButton *smokerButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *infosButton;
@property (retain, nonatomic) UIDatePicker *birthdayDatePicker;
@property (retain, nonatomic) UIPickerView *situationPickerView;
@property (retain, nonatomic) UIPickerView *quotityPickerView;
@property (retain, nonatomic) UIPickerView *riskPickerView;
@property (retain, nonatomic) UIPickerView *smokerPickerView;
@property (retain, nonatomic) NSMutableArray *situationArray;
@property (retain, nonatomic) NSMutableArray *quotityArray;
@property (retain, nonatomic) NSMutableArray *riskArray;
@property (retain, nonatomic) NSMutableArray *smokerArray;
@property (retain, nonatomic) NSString *situation;
@property (retain, nonatomic) NSString *quotity;
@property (retain, nonatomic) NSString *risk;
@property (retain, nonatomic) NSString *smoker;
@property (retain, nonatomic) DetailsView2Controller *detailsView2Controller;

@end

@implementation InsurancesComparatorStep2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.situationArray = [[NSMutableArray alloc] init];
    self.quotityArray = [[NSMutableArray alloc] init];
    self.riskArray = [[NSMutableArray alloc] init];
    self.smokerArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.situationArray addObject:@"Célibataire"];
    [self.situationArray addObject:@"Divorcé"];
    [self.situationArray addObject:@"Marié"];
    [self.situationArray addObject:@"Pacs"];
    [self.situationArray addObject:@"Union libre"];
    [self.situationArray addObject:@"Veuf"];
    
    [self.quotityArray addObject:@"5%"];
    [self.quotityArray addObject:@"10%"];
    [self.quotityArray addObject:@"15%"];
    [self.quotityArray addObject:@"20%"];
    [self.quotityArray addObject:@"25%"];
    [self.quotityArray addObject:@"30%"];
    [self.quotityArray addObject:@"35%"];
    [self.quotityArray addObject:@"40%"];
    [self.quotityArray addObject:@"45%"];
    [self.quotityArray addObject:@"50%"];
    [self.quotityArray addObject:@"55%"];
    [self.quotityArray addObject:@"60%"];
    [self.quotityArray addObject:@"65%"];
    [self.quotityArray addObject:@"70%"];
    [self.quotityArray addObject:@"75%"];
    [self.quotityArray addObject:@"80%"];
    [self.quotityArray addObject:@"85%"];
    [self.quotityArray addObject:@"90%"];
    [self.quotityArray addObject:@"95%"];
    [self.quotityArray addObject:@"100%"];
    
    [self.riskArray addObject:@"Non"];
    [self.riskArray addObject:@"Oui"];
    
    [self.smokerArray addObject:@"Non fumeur"];
    [self.smokerArray addObject:@"Fumeur"];

    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    self.infosButton.backgroundColor = UIColorFromRGB(0xCCCCCC);
    
    [self.nextButton setImage:[UIImage imageNamed:@"NextButtonNormal"] forState:UIControlStateNormal];
    [self.nextButton setImage:[UIImage imageNamed:@"NextButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonNormal"] forState:UIControlStateNormal];
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    self.birthdayDatePicker = [[UIDatePicker alloc] init];
    self.birthdayDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.birthdayDatePicker setDate:[NSDate date]];
    [self.birthdayDatePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self.birthdayTextField setInputView:self.birthdayDatePicker];
}

- (void)updateTextField:(id)sender {
    UIDatePicker *picker = (UIDatePicker*)self.birthdayTextField.inputView;
    self.birthdayTextField.text = [NSString stringWithFormat:@"%@", picker.date];
}

- (IBAction)civilityChoice:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
}

- (IBAction)situationType:(id)sender {
    self.situationPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.situationPickerView.backgroundColor = [UIColor whiteColor];
    self.situationPickerView.dataSource = self;
    self.situationPickerView.delegate = self;
    self.situationPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.situationPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.situationPickerView];
    }];
}

- (IBAction)quotityType:(id)sender {
    self.quotityPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.quotityPickerView.backgroundColor = [UIColor whiteColor];
    self.quotityPickerView.dataSource = self;
    self.quotityPickerView.delegate = self;
    self.quotityPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.quotityPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.quotityPickerView];
    }];
}

- (IBAction)riskType:(id)sender {
    self.riskPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.riskPickerView.backgroundColor = [UIColor whiteColor];
    self.riskPickerView.dataSource = self;
    self.riskPickerView.delegate = self;
    self.riskPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.riskPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.riskPickerView];
    }];
}

- (IBAction)smokerType:(id)sender {
    self.smokerPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.smokerPickerView.backgroundColor = [UIColor whiteColor];
    self.smokerPickerView.dataSource = self;
    self.smokerPickerView.delegate = self;
    self.smokerPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.smokerPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.smokerPickerView];
    }];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    if (pickerView == self.situationPickerView) {
        self.situation = [NSString stringWithFormat:@"%@", [self.situationArray objectAtIndex:row]];
        self.situationButton.titleLabel.text = self.situation;
    } else if (pickerView == self.quotityPickerView) {
        self.quotity = [NSString stringWithFormat:@"%@", [self.quotityArray objectAtIndex:row]];
        self.quotityButton.titleLabel.text = self.quotity;
    } else if (pickerView == self.riskPickerView) {
        self.risk = [NSString stringWithFormat:@"%@", [self.riskArray objectAtIndex:row]];
        self.riskButton.titleLabel.text = self.risk;
    } else if (pickerView == self.smokerPickerView) {
        self.smoker = [NSString stringWithFormat:@"%@", [self.smokerArray objectAtIndex:row]];
        self.smokerButton.titleLabel.text = self.smoker;
    }
    
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.situationPickerView) {
        return [self.situationArray count];
    } else if (pickerView == self.quotityPickerView) {
        return [self.quotityArray count];
    } else if (pickerView == self.riskPickerView) {
        return [self.riskArray count];
    } else if (pickerView == self.smokerPickerView) {
        return [self.smokerArray count];
    } else {
        return 0;
    }
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.situationPickerView) {
        return [self.situationArray objectAtIndex: row];
    } else if (pickerView == self.quotityPickerView) {
        return [self.quotityArray objectAtIndex: row];
    } else if (pickerView == self.riskPickerView) {
        return [self.riskArray objectAtIndex: row];
    } else if (pickerView == self.smokerPickerView) {
        return [self.smokerArray objectAtIndex: row];
    } else {
        return @"";
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.situationButton || [touch view] != self.quotityButton || [touch view] != self.riskButton || [touch view] != self.smokerButton || [touch view] != self.birthdayTextField) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.situationPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.situationPickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.quotityPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.quotityPickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.riskPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.riskPickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.smokerPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.smokerPickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.birthdayDatePicker removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)showInfosView:(id)sender {
    self.detailsView2Controller = [[DetailsView2Controller alloc] initWithNibName:@"DetailsView2" bundle:nil];
    self.detailsView2Controller.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.detailsView2Controller.view.bounds.size.height);
    self.detailsView2Controller.delegate = self;
    
    [UIView animateWithDuration:0.30 animations:^{
        [self.detailsView2Controller.view setFrame:CGRectMake(0, self.view.bounds.size.height - self.detailsView2Controller.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        [self.view addSubview:self.detailsView2Controller.view];
    }];
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToInsurancesComparatorStep3View];
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToInsurancesComparatorStep1View];
}

- (IBAction)returnToInsurancesComparatorStep1FromInsurancesComparatorStep2View:(id)sender {
    [self.delegate returnToInsurancesComparatorStep1View];
}

- (void)hideDetailsView2 {
    [UIView animateWithDuration:0.30 animations:^{
        self.detailsView2Controller.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.detailsView2Controller.view.bounds.size.height);
    } completion:^(BOOL finished){ [self.detailsView2Controller.view removeFromSuperview]; }];
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
