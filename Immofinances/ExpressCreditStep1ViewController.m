//
//  ExpressCreditStep1ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ExpressCreditStep1ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ExpressCreditStep1ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UIButton *subjectButton;
@property (weak, nonatomic) IBOutlet UIButton *durationButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *infosButton;
@property (retain, nonatomic) UIPickerView *subjectPickerView;
@property (retain, nonatomic) NSMutableArray *subjectArray;
@property (retain, nonatomic) NSString *subject;
@property (retain, nonatomic) UIPickerView *durationPickerView;
@property (retain, nonatomic) NSMutableArray *durationArray;
@property (retain, nonatomic) NSString *duration;


@end

@implementation ExpressCreditStep1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.subjectArray = [[NSMutableArray alloc] init];
    self.durationArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.subjectArray addObject:@"Appartement"];
    [self.subjectArray addObject:@"Commerce"];
    [self.subjectArray addObject:@"Duplex"];
    [self.subjectArray addObject:@"Fond de commerce"];
    [self.subjectArray addObject:@"Grange"];
    [self.subjectArray addObject:@"Immeuble"];
    [self.subjectArray addObject:@"Maison de village"];
    [self.subjectArray addObject:@"Mas"];
    [self.subjectArray addObject:@"Murs commerciaux"];
    [self.subjectArray addObject:@"Nu-propriété"];
    [self.subjectArray addObject:@"Parts sociales"];
    [self.subjectArray addObject:@"Terrain"];
    [self.subjectArray addObject:@"Terrain+construction"];
    [self.subjectArray addObject:@"Travaux"];
    [self.subjectArray addObject:@"Usufruit"];
    [self.subjectArray addObject:@"Villa"];
    
    for (int i = 5; i < 41; i++) {
        [self.durationArray addObject:[NSString stringWithFormat:@"%d ans", i]];
    }
    
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

- (IBAction)objectState:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
}

- (IBAction)garantee:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
}

- (IBAction)subjectType:(id)sender {
    self.subjectPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.subjectPickerView.backgroundColor = [UIColor whiteColor];
    self.subjectPickerView.dataSource = self;
    self.subjectPickerView.delegate = self;
    self.subjectPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.subjectPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.subjectPickerView];
    }];
}

- (IBAction)durationValue:(id)sender {
    self.durationPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.durationPickerView.backgroundColor = [UIColor whiteColor];
    self.durationPickerView.dataSource = self;
    self.durationPickerView.delegate = self;
    self.durationPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.durationPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.durationPickerView];
    }];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    if (pickerView == self.subjectPickerView) {
        self.subject = [NSString stringWithFormat:@"%@", [self.subjectArray objectAtIndex:row]];
        self.subjectButton.titleLabel.text = self.subject;
    } else if (pickerView == self.durationPickerView) {
        self.duration = [NSString stringWithFormat:@"%@", [self.durationArray objectAtIndex:row]];
        self.durationButton.titleLabel.text = self.duration;
    }
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.subjectPickerView) {
        return [self.subjectArray count];
    } else if (pickerView == self.durationPickerView) {
        return [self.durationArray count];
    } else {
        return 1;
    }
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.subjectPickerView) {
        return [self.subjectArray objectAtIndex: row];
    } else if (pickerView == self.durationPickerView) {
        return [self.durationArray objectAtIndex: row];
    } else {
        return @"";
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.subjectButton || [touch view] != self.durationButton) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.subjectPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.subjectPickerView removeFromSuperview];
            
            [self.durationPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.durationPickerView removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToExpressCreditStep2View];
}

- (IBAction)returnToHomeViewFromExpressCreditStep1View:(id)sender {
    [self.delegate returnToHomeViewFromExpressCreditStep1View];
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
