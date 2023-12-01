//
//  ExpressCreditStep5ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ExpressCreditStep5ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ExpressCreditStep5ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipcodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *localityTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIButton *youAreButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (retain, nonatomic) UIPickerView *youArePickerView;
@property (retain, nonatomic) NSMutableArray *youAreArray;
@property (retain, nonatomic) NSString *youAre;

@end

@implementation ExpressCreditStep5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.youAreArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.youAreArray addObject:@"Logement de fonction"];
    [self.youAreArray addObject:@"Locataire"];
    [self.youAreArray addObject:@"Propriétaire"];
    [self.youAreArray addObject:@"Hébergé"];
    
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
}

- (IBAction)youAreType:(id)sender {
    self.youArePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.youArePickerView.backgroundColor = [UIColor whiteColor];
    self.youArePickerView.dataSource = self;
    self.youArePickerView.delegate = self;
    self.youArePickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.youArePickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.youArePickerView];
    }];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    self.youAre = [NSString stringWithFormat:@"%@", [self.youAreArray objectAtIndex:row]];
    self.youAreButton.titleLabel.text = self.youAre;
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.youAreArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.youAreArray objectAtIndex: row];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.youAreButton) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.youArePickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.youArePickerView removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToExpressCreditStep6View];
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToExpressCreditStep4View];
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
