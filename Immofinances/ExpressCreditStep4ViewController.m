//
//  ExpressCreditView4Controller.m
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ExpressCreditStep4ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ExpressCreditStep4ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *daughterFirstnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthplaceTextField;
@property (weak, nonatomic) IBOutlet UITextField *nationalityTextField;
@property (weak, nonatomic) IBOutlet UITextField *childrenNumberTextField;
@property (weak, nonatomic) IBOutlet UIButton *situationButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (retain, nonatomic) UIDatePicker *birthdayDatePicker;
@property (retain, nonatomic) UIPickerView *situationPickerView;
@property (retain, nonatomic) NSMutableArray *situationArray;
@property (retain, nonatomic) NSString *situation;

@end

@implementation ExpressCreditStep4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.situationArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.situationArray addObject:@"Célibataire"];
    [self.situationArray addObject:@"Divorcé"];
    [self.situationArray addObject:@"Marié"];
    [self.situationArray addObject:@"Pacs"];
    [self.situationArray addObject:@"Union libre"];
    [self.situationArray addObject:@"Veuf"];
    
    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
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

- (IBAction)nationalityChoice:(id)sender {
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.situation = [NSString stringWithFormat:@"%@", [self.situationArray objectAtIndex:row]];
    self.situationButton.titleLabel.text = self.situation;
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.situationArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.situationArray objectAtIndex: row];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.situationButton || [touch view] != self.birthdayTextField) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.situationPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.situationPickerView removeFromSuperview];
        }];
        
        [UIView animateWithDuration:0.30 animations:^{
            [self.birthdayDatePicker setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.birthdayDatePicker removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToExpressCreditStep5View];
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToExpressCreditStep3View];
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
