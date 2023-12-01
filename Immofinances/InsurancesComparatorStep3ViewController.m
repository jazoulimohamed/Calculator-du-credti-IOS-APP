//
//  InsurancesComparatorStep3ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "InsurancesComparatorStep3ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface InsurancesComparatorStep3ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *occupationTextField;
@property (weak, nonatomic) IBOutlet UIButton *situationButton;
@property (weak, nonatomic) IBOutlet UIButton *quotityButton;
@property (weak, nonatomic) IBOutlet UIButton *riskButton;
@property (weak, nonatomic) IBOutlet UIButton *smokerButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray *occupationsArray;
@property (strong, nonatomic) NSMutableArray *yesNoArray;
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UITextField *textField1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
@property (strong, nonatomic) UIButton *button4;
@property (strong, nonatomic) UIButton *button5;
@property (strong, nonatomic) UIButton *button6;
@property (strong, nonatomic) UIButton *button7;
@property (strong, nonatomic) UIButton *button8;
@property (strong, nonatomic) UIButton *button9;
@property (strong, nonatomic) UIButton *button10;
@property (strong, nonatomic) UIButton *button11;
@property (strong, nonatomic) UIButton *infosButton;
@property (strong, nonatomic) UIPickerView *pickerView1;
@property (strong, nonatomic) UIPickerView *pickerView2;
@property (strong, nonatomic) UIPickerView *pickerView3;
@property (strong, nonatomic) UIPickerView *pickerView4;
@property (strong, nonatomic) UIPickerView *pickerView5;
@property (strong, nonatomic) UIPickerView *pickerView6;
@property (strong, nonatomic) UIPickerView *pickerView7;
@property (strong, nonatomic) UIPickerView *pickerView8;
@property (strong, nonatomic) UIPickerView *pickerView9;
@property (strong, nonatomic) UIPickerView *pickerView10;
@property (strong, nonatomic) UIPickerView *pickerView11;
@property (strong, nonatomic) NSString *pickerValue1;
@property (strong, nonatomic) NSString *pickerValue2;
@property (strong, nonatomic) NSString *pickerValue3;
@property (strong, nonatomic) NSString *pickerValue4;
@property (strong, nonatomic) NSString *pickerValue5;
@property (strong, nonatomic) NSString *pickerValue6;
@property (strong, nonatomic) NSString *pickerValue7;
@property (strong, nonatomic) NSString *pickerValue8;
@property (strong, nonatomic) NSString *pickerValue9;
@property (strong, nonatomic) NSString *pickerValue10;
@property (strong, nonatomic) NSString *pickerValue11;
@property (retain, nonatomic) DetailsView3Controller *detailsView3Controller;
@property (strong, nonatomic) UIScrollView *detailsScrollView;

@end

@implementation InsurancesComparatorStep3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.occupationsArray = [[NSMutableArray alloc] init];
    self.yesNoArray = [[NSMutableArray alloc] init];
    
    [self.occupationsArray addObject:@"Salarié Cadre"];
    [self.occupationsArray addObject:@"Salarié Non Cadre"];
    [self.occupationsArray addObject:@"Artisan"];
    [self.occupationsArray addObject:@"Commerçant"];
    [self.occupationsArray addObject:@"Fonctionnaire cadre"];
    [self.occupationsArray addObject:@"Fonctionnaire non cadre"];
    [self.occupationsArray addObject:@"Dentiste"];
    [self.occupationsArray addObject:@"Pharmacien"];
    [self.occupationsArray addObject:@"Médecin/chirurgien"];
    [self.occupationsArray addObject:@"Dirigeant d'entreprise"];
    [self.occupationsArray addObject:@"Retraité non cadre"];
    [self.occupationsArray addObject:@"Retraité cadre"];
    [self.occupationsArray addObject:@"Exp. agricole/viticole"];
    [self.occupationsArray addObject:@"Sans profession"];
    [self.occupationsArray addObject:@"Profession libérale"];
    [self.occupationsArray addObject:@"Intermittant"];
    
    [self.yesNoArray addObject:@"Non"];
    [self.yesNoArray addObject:@"Oui"];

    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.scrollView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    
    singleTap.cancelsTouchesInView = NO;
    
    [self.scrollView addGestureRecognizer:singleTap];
    //self.infosButton.backgroundColor = UIColorFromRGB(0xCCCCCC);

    [self.nextButton setImage:[UIImage imageNamed:@"NextButtonNormal"] forState:UIControlStateNormal];
    [self.nextButton setImage:[UIImage imageNamed:@"NextButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonNormal"] forState:UIControlStateNormal];
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    int x = 10;
    int y = 10;
    int height = 30;
    int width = 140;
    int scrollWidth = 0;
    if ([UIScreen mainScreen].bounds.size.width == 414.00){
        scrollWidth = 375 - 16;
    } else {
        scrollWidth = 320 - 16;
    }
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    label1.font = font;
    label1.text = @"Statut Professionnel";
    label1.numberOfLines = 1;
    label1.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label1];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button1 addTarget:self
                     action:@selector(showPicker1:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button1 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button1 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button1 setTitle:@"Salarié Cadre" forState:UIControlStateNormal];
    self.button1.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button1.titleLabel.font = font;
    self.button1.titleLabel.textColor = [UIColor whiteColor];
    self.button1.userInteractionEnabled = YES;
    //self.button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.scrollView addSubview:self.button1];
    
    NSLog(@"width %f", self.scrollView.bounds.size.width);
    
    y += height + 10;
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label2.font = font;
    label2.text = @"Profession";
    label2.numberOfLines = 1;
    label2.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label2];
    
    self.textField1 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField1.font = font;
    [self.textField1 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField1.keyboardType = UIKeyboardTypeDefault;
    self.textField1.returnKeyType = UIReturnKeyDone;
    self.textField1.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField1];
    
    y += height + 10;
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label3.font = font;
    label3.text = @"Option Décès + PTIA";
    label3.numberOfLines = 1;
    label3.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label3.backgroundColor = [UIColor clearColor];
    label3.textColor = [UIColor whiteColor];
    label3.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label3];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button2 addTarget:self
                     action:@selector(showPicker2:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button2 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button2 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button2 setTitle:@"Non" forState:UIControlStateNormal];
    self.button2.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button2.titleLabel.font = font;
    self.button2.titleLabel.textColor = [UIColor whiteColor];
    //self.button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.scrollView addSubview:self.button2];
    
    y += height + 10;
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label4.font = font;
    label4.text = @"Option ITT";
    label4.numberOfLines = 1;
    label4.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label4.backgroundColor = [UIColor clearColor];
    label4.textColor = [UIColor whiteColor];
    label4.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label4];
    
    self.button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button3 addTarget:self
                     action:@selector(showPicker3:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button3 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button3 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button3 setTitle:@"Non" forState:UIControlStateNormal];
    self.button3.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button3.titleLabel.font = font;
    self.button3.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button3];
    
    y += height + 10;
    
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label5.font = font;
    label5.text = @"Option IPP";
    label5.numberOfLines = 1;
    label5.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label5.backgroundColor = [UIColor clearColor];
    label5.textColor = [UIColor whiteColor];
    label5.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label5];
    
    self.button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button4 addTarget:self
                     action:@selector(showPicker4:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button4 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button4 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button4 setTitle:@"Non" forState:UIControlStateNormal];
    self.button4.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button4.titleLabel.font = font;
    self.button4.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button4];
    
    y += height + 10;
    
    UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label6.font = font;
    label6.text = @"Option IPT";
    label6.numberOfLines = 1;
    label6.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label6.backgroundColor = [UIColor clearColor];
    label6.textColor = [UIColor whiteColor];
    label6.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label6];
    
    self.button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button5 addTarget:self
                     action:@selector(showPicker5:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button5 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button5 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button5 setTitle:@"Non" forState:UIControlStateNormal];
    self.button5.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button5.titleLabel.font = font;
    self.button5.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button5];
    
    y += height + 10;
    
    UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label7.font = font;
    label7.text = @"Option MNO";
    label7.numberOfLines = 1;
    label7.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label7.backgroundColor = [UIColor clearColor];
    label7.textColor = [UIColor whiteColor];
    label7.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label7];
    
    self.button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button6 addTarget:self
                     action:@selector(showPicker6:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button6 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button6 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button6 setTitle:@"Non" forState:UIControlStateNormal];
    self.button6.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button6.titleLabel.font = font;
    self.button6.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button6];
    
    y += height + 10;
    
    UILabel *label8 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label8.font = font;
    label8.text = @"Option PE";
    label8.numberOfLines = 1;
    label8.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label8.backgroundColor = [UIColor clearColor];
    label8.textColor = [UIColor whiteColor];
    label8.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label8];
    
    self.button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button7 addTarget:self
                     action:@selector(showPicker7:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button7 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button7 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button7 setTitle:@"Non" forState:UIControlStateNormal];
    self.button7.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button7.titleLabel.font = font;
    self.button7.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button7];
    
    y += height + 10;
    
    UILabel *label9 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label9.font = font;
    label9.text = @"Activé à temps partiel";
    label9.numberOfLines = 1;
    label9.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label9.backgroundColor = [UIColor clearColor];
    label9.textColor = [UIColor whiteColor];
    label9.textAlignment = NSTextAlignmentLeft;
    label9.lineBreakMode = NSLineBreakByWordWrapping;
    label9.numberOfLines = 0;
    [self.scrollView addSubview:label9];
    
    self.button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button8 addTarget:self
                     action:@selector(showPicker8:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button8 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button8 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button8 setTitle:@"Non" forState:UIControlStateNormal];
    self.button8.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button8.titleLabel.font = font;
    self.button8.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button8];
    
    y += height + 10;
    
    UILabel *label10 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label10.font = font;
    label10.text = @"Déplacements pros?";
    label10.numberOfLines = 1;
    label10.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label10.backgroundColor = [UIColor clearColor];
    label10.textColor = [UIColor whiteColor];
    label10.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label10];
    
    self.button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button9 addTarget:self
                     action:@selector(showPicker9:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button9 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button9 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button9 setTitle:@"Non" forState:UIControlStateNormal];
    self.button9.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button9.titleLabel.font = font;
    self.button9.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button9];
    
    y += height + 10;
    
    UILabel *label11 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label11.font = font;
    label11.text = @"Activité manutention";
    label11.numberOfLines = 1;
    label11.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label11.backgroundColor = [UIColor clearColor];
    label11.textColor = [UIColor whiteColor];
    label11.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label11];
    
    self.button10 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button10 addTarget:self
                     action:@selector(showPicker10:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.button10 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button10 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button10 setTitle:@"Non" forState:UIControlStateNormal];
    self.button10.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button10.titleLabel.font = font;
    self.button10.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button10];
    
    y += height + 10;
    
    UILabel *label12 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label12.font = font;
    label12.text = @"Travail en hauteur";
    label12.numberOfLines = 1;
    label12.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    label12.backgroundColor = [UIColor clearColor];
    label12.textColor = [UIColor whiteColor];
    label12.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label12];
    
    self.button11 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button11 addTarget:self
                      action:@selector(showPicker11:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.button11 setBackgroundImage:[UIImage imageNamed:@"SelectButtonNormal"] forState:UIControlStateNormal];
    [self.button11 setBackgroundImage:[UIImage imageNamed:@"SelectButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    [self.button11 setTitle:@"Non" forState:UIControlStateNormal];
    self.button11.frame = CGRectMake(scrollWidth - width - 10, y, width, height);
    self.button11.titleLabel.font = font;
    self.button11.titleLabel.textColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.button11];
    
    y += height + 10;
    
    self.infosButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.infosButton addTarget:self
                      action:@selector(showInfosView:)
            forControlEvents:UIControlEventTouchUpInside];
    self.infosButton.backgroundColor = UIColorFromRGB(0xCCCCCC);
    [self.infosButton setTitle:@"?" forState:UIControlStateNormal];
    self.infosButton.titleLabel.textColor = UIColorFromRGB(0x666666);
    self.infosButton.frame = CGRectMake(scrollWidth - 40, y, 35, 35);
    self.infosButton.titleLabel.font = font;
    [self.scrollView addSubview:self.infosButton];
    
    y += 50;
    
    self.scrollView.contentSize = CGSizeMake(scrollWidth, y);
}

- (void)showPicker1:(id)sender {
    self.pickerView1 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView1.backgroundColor = [UIColor whiteColor];
    self.pickerView1.dataSource = self;
    self.pickerView1.delegate = self;
    self.pickerView1.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView1 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView1];
    }];
}

- (void)showPicker2:(id)sender {
    self.pickerView2 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView2.backgroundColor = [UIColor whiteColor];
    self.pickerView2.dataSource = self;
    self.pickerView2.delegate = self;
    self.pickerView2.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView2 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView2];
    }];
}

- (void)showPicker3:(id)sender {
    self.pickerView3 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView3.backgroundColor = [UIColor whiteColor];
    self.pickerView3.dataSource = self;
    self.pickerView3.delegate = self;
    self.pickerView3.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView3 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView3];
    }];
}

- (void)showPicker4:(id)sender {
    self.pickerView4 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView4.backgroundColor = [UIColor whiteColor];
    self.pickerView4.dataSource = self;
    self.pickerView4.delegate = self;
    self.pickerView4.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView4 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView4];
    }];
}

- (void)showPicker5:(id)sender {
    self.pickerView5 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView5.backgroundColor = [UIColor whiteColor];
    self.pickerView5.dataSource = self;
    self.pickerView5.delegate = self;
    self.pickerView5.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView5 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView5];
    }];
}

- (void)showPicker6:(id)sender {
    self.pickerView6 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView6.backgroundColor = [UIColor whiteColor];
    self.pickerView6.dataSource = self;
    self.pickerView6.delegate = self;
    self.pickerView6.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView6 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView6];
    }];
}

- (void)showPicker7:(id)sender {
    self.pickerView7 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView7.backgroundColor = [UIColor whiteColor];
    self.pickerView7.dataSource = self;
    self.pickerView7.delegate = self;
    self.pickerView7.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView7 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView7];
    }];
}

- (void)showPicker8:(id)sender {
    self.pickerView8 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView8.backgroundColor = [UIColor whiteColor];
    self.pickerView8.dataSource = self;
    self.pickerView8.delegate = self;
    self.pickerView8.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView8 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView8];
    }];
}

- (void)showPicker9:(id)sender {
    self.pickerView9 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView9.backgroundColor = [UIColor whiteColor];
    self.pickerView9.dataSource = self;
    self.pickerView9.delegate = self;
    self.pickerView9.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView9 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView9];
    }];
}

- (void)showPicker10:(id)sender {
    self.pickerView10 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView10.backgroundColor = [UIColor whiteColor];
    self.pickerView10.dataSource = self;
    self.pickerView10.delegate = self;
    self.pickerView10.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView10 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView10];
    }];
}

- (void)showPicker11:(id)sender {
    self.pickerView11 = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.pickerView11.backgroundColor = [UIColor whiteColor];
    self.pickerView11.dataSource = self;
    self.pickerView11.delegate = self;
    self.pickerView11.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.pickerView11 setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.pickerView11];
    }];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    if (pickerView == self.pickerView1) {
        self.pickerValue1 = [NSString stringWithFormat:@"%@", [self.occupationsArray objectAtIndex:row]];
        self.button1.titleLabel.text = self.pickerValue1;
    } else if (pickerView == self.pickerView2) {
        self.pickerValue2 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button2.titleLabel.text = self.pickerValue2;
    } else if (pickerView == self.pickerView3) {
        self.pickerValue3 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button3.titleLabel.text = self.pickerValue3;
    } else if (pickerView == self.pickerView4) {
        self.pickerValue4 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button4.titleLabel.text = self.pickerValue4;
    } else if (pickerView == self.pickerView5) {
        self.pickerValue5 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button5.titleLabel.text = self.pickerValue5;
    } else if (pickerView == self.pickerView6) {
        self.pickerValue6 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button6.titleLabel.text = self.pickerValue6;
    } else if (pickerView == self.pickerView7) {
        self.pickerValue7 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button7.titleLabel.text = self.pickerValue7;
    } else if (pickerView == self.pickerView8) {
        self.pickerValue8 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button8.titleLabel.text = self.pickerValue8;
    } else if (pickerView == self.pickerView9) {
        self.pickerValue9 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button9.titleLabel.text = self.pickerValue9;
    } else if (pickerView == self.pickerView10) {
        self.pickerValue10 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button10.titleLabel.text = self.pickerValue10;
    } else if (pickerView == self.pickerView11) {
        self.pickerValue11 = [NSString stringWithFormat:@"%@", [self.yesNoArray objectAtIndex:row]];
        self.button11.titleLabel.text = self.pickerValue11;
    }
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.pickerView1) {
        return [self.occupationsArray count];
    } else {
        return [self.yesNoArray count];
    }
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.pickerView1) {
        return [self.occupationsArray objectAtIndex: row];
    } else {
        return [self.yesNoArray objectAtIndex: row];
    }
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)recognizer {
    NSLog(@"Touch event1");
    CGPoint touchPoint = [recognizer locationInView:self.scrollView];
    NSLog(@"touchPoint %@", NSStringFromCGPoint(touchPoint));
    if (touchPoint.x < 200) {
        NSLog(@"Hide");
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView1 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView1 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView2 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView2 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView3 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView3 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView4 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView4 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView5 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView5 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView6 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView6 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView7 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView7 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView8 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView8 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView9 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView9 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView10 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView10 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView11 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView11 removeFromSuperview];
        }];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.button1 || [touch view] != self.button2 || [touch view] != self.button3 || [touch view] != self.button4 || [touch view] != self.button5 || [touch view] != self.button6 || [touch view] != self.button7 || [touch view] != self.button8 || [touch view] != self.button9 || [touch view] != self.button10 || [touch view] != self.button11) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView1 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView1 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView2 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView2 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView3 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView3 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView4 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView4 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView5 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView5 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView6 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView6 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView7 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView7 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView8 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView8 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView9 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView9 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView10 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView10 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView11 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView11 removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)showInfosView:(id)sender {
    self.detailsView3Controller = [[DetailsView3Controller alloc] initWithNibName:@"DetailsView3" bundle:nil];
    self.detailsView3Controller.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.detailsView3Controller.view.bounds.size.height);
    self.detailsView3Controller.delegate = self;
    
    self.detailsScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 360)];
    self.detailsScrollView.backgroundColor = [UIColor whiteColor];
    [self.detailsScrollView addSubview:self.detailsView3Controller.view];
    self.detailsScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.detailsView3Controller.view.bounds.size.height);
    [UIView animateWithDuration:0.30 animations:^{
        [self.detailsScrollView setFrame:CGRectMake(0, self.view.bounds.size.height - 360, self.view.bounds.size.width, 360)];
        [self.view addSubview:self.detailsScrollView];
    }];
    
}

- (void)hideDetailsView3 {
    [UIView animateWithDuration:0.30 animations:^{
        self.detailsScrollView.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.detailsScrollView.bounds.size.height);
    } completion:^(BOOL finished){ [self.detailsScrollView removeFromSuperview]; }];
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToInsurancesComparatorStep4View];
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToInsurancesComparatorStep2View];
}

- (IBAction)returnToInsurancesComparatorStep2FromInsurancesComparatorStep3View:(id)sender {
    [self.delegate returnToInsurancesComparatorStep2View];
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
