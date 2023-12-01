//
//  InsurancesComparatorStep1ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 20/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "InsurancesComparatorStep1ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface InsurancesComparatorStep1ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *amountTextView;
@property (weak, nonatomic) IBOutlet UITextField *rateTextView;
@property (weak, nonatomic) IBOutlet UITextField *durationTextView;
@property (weak, nonatomic) IBOutlet UIButton *borrowingTypeButton;
@property (weak, nonatomic) IBOutlet UITextField *differedTextView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *infosButton;
@property (retain, nonatomic) UIPickerView *borrowingTypePickerView;
@property (retain, nonatomic) NSMutableArray *borrowingTypesArray;
@property (retain, nonatomic) NSString *borrowingType;
@property (retain, nonatomic) DetailsView1Controller *detailsView1Controller;


@end

@implementation InsurancesComparatorStep1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.borrowingTypesArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.borrowingTypesArray addObject:@"Amortissable"];
    [self.borrowingTypesArray addObject:@"In Fine"];
    
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
}

- (IBAction)personalToInsure:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
}

- (IBAction)borrowingNumber:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
}

- (IBAction)borrowingType:(id)sender {
    self.borrowingTypePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.borrowingTypePickerView.backgroundColor = [UIColor whiteColor];
    self.borrowingTypePickerView.dataSource = self;
    self.borrowingTypePickerView.delegate = self;
    self.borrowingTypePickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.borrowingTypePickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.borrowingTypePickerView];
    }];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection

    self.borrowingType = [NSString stringWithFormat:@"%@", [self.borrowingTypesArray objectAtIndex:row]];
    self.borrowingTypeButton.titleLabel.text = self.borrowingType;
    
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.borrowingTypesArray count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.borrowingTypesArray objectAtIndex: row];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.borrowingTypeButton) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.borrowingTypePickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.borrowingTypePickerView removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)showInfosView:(id)sender {
    self.detailsView1Controller = [[DetailsView1Controller alloc] initWithNibName:@"DetailsView1" bundle:nil];
    self.detailsView1Controller.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.detailsView1Controller.view.bounds.size.height);
    self.detailsView1Controller.delegate = self;

    [UIView animateWithDuration:0.30 animations:^{
        [self.detailsView1Controller.view setFrame:CGRectMake(0, self.view.bounds.size.height - self.detailsView1Controller.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        [self.view addSubview:self.detailsView1Controller.view];
    }];
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToInsurancesComparatorStep2View];
}

- (void)hideDetailsView1 {
    [UIView animateWithDuration:0.30 animations:^{
        self.detailsView1Controller.view.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.detailsView1Controller.view.bounds.size.height);
    } completion:^(BOOL finished){ [self.detailsView1Controller.view removeFromSuperview]; }];
}

- (IBAction)returnToHomeViewFromInsurancesComparatorStep1View:(id)sender {
    [self.delegate returnToHomeViewFromInsurancesComparatorStep1View];
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
