//
//  ExpressCreditStep3ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 28/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ExpressCreditStep3ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ExpressCreditStep3ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (strong, nonatomic) UITextField *textField1;
@property (strong, nonatomic) UITextField *textField2;
@property (strong, nonatomic) UITextField *textField3;
@property (strong, nonatomic) UITextField *textField4;
@property (strong, nonatomic) UITextField *textField5;
@property (strong, nonatomic) UITextField *textField6;
@property (strong, nonatomic) UITextField *textField7;
@property (strong, nonatomic) UITextField *textField8;
@property (strong, nonatomic) UITextField *textField9;
@property (strong, nonatomic) UITextField *textField10;
@property (strong, nonatomic) UITextField *textField11;
@property (strong, nonatomic) UITextField *textField12;
@property (strong, nonatomic) UITextField *textField13;
@property (strong, nonatomic) UITextField *textField14;
@property (strong, nonatomic) UITextField *textField15;

@end

@implementation ExpressCreditStep3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.scrollView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
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
    
    
    UILabel *labelTitle1 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width + 60, height)];
    UIFont *titleFont = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    labelTitle1.font = titleFont;
    labelTitle1.text = @"REVENUS EMPRUNTEUR";
    labelTitle1.numberOfLines = 1;
    labelTitle1.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labelTitle1.backgroundColor = [UIColor clearColor];
    labelTitle1.textColor = UIColorFromRGB(0x414342);
    labelTitle1.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:labelTitle1];
    
    y += height + 10;
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label1.font = font;
    label1.text = @"Revenus mensuels (année en cours)";
    label1.numberOfLines = 2;
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor whiteColor];
    label1.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label1];
    
    self.textField1 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField1.font = font;
    self.textField1.text = @"1230";
    [self.textField1 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField1.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField1.keyboardType = UIKeyboardTypeDefault;
    self.textField1.returnKeyType = UIReturnKeyDone;
    self.textField1.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField1];
    
    y += height + 10;
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label2.font = font;
    label2.text = @"Revenus (annuels-1) nets professionnels";
    label2.numberOfLines = 2;
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label2];
    
    self.textField2 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField2.font = font;
    self.textField2.text = @"0";
    [self.textField2 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField2.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField2.keyboardType = UIKeyboardTypeDefault;
    self.textField2.returnKeyType = UIReturnKeyDone;
    self.textField2.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField2];
    
    y += height + 10;
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label3.font = font;
    label3.text = @"Revenu fiscal de référence";
    label3.numberOfLines = 2;
    label3.backgroundColor = [UIColor clearColor];
    label3.textColor = [UIColor whiteColor];
    label3.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label3];
    
    self.textField3 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField3.font = font;
    self.textField3.text = @"0";
    [self.textField3 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField3.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField3.keyboardType = UIKeyboardTypeDefault;
    self.textField3.returnKeyType = UIReturnKeyDone;
    self.textField3.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField3];
    
    y += height + 10;
    
    UILabel *label4 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label4.font = font;
    label4.text = @"Allocations familiales mensuels";
    label4.numberOfLines = 2;
    label4.backgroundColor = [UIColor clearColor];
    label4.textColor = [UIColor whiteColor];
    label4.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label4];
    
    self.textField4 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField4.font = font;
    self.textField4.text = @"0";
    [self.textField4 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField4.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField4.keyboardType = UIKeyboardTypeDefault;
    self.textField4.returnKeyType = UIReturnKeyDone;
    self.textField4.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField4];
    
    y += height + 10;
    
    UILabel *label5 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label5.font = font;
    label5.text = @"Aide personnalisée au logement mensuelle";
    label5.numberOfLines = 2;
    label5.backgroundColor = [UIColor clearColor];
    label5.textColor = [UIColor whiteColor];
    label5.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label5];
    
    self.textField5 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField5.font = font;
    self.textField5.text = @"0";
    [self.textField5 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField5.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField5.keyboardType = UIKeyboardTypeDefault;
    self.textField5.returnKeyType = UIReturnKeyDone;
    self.textField5.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField5];
    
    y += height + 10;
    
    UILabel *label6 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label6.font = font;
    label6.text = @"Pension alimentaire mensuelle";
    label6.numberOfLines = 2;
    label6.backgroundColor = [UIColor clearColor];
    label6.textColor = [UIColor whiteColor];
    label6.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label6];
    
    self.textField6 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField6.font = font;
    self.textField6.text = @"0";
    [self.textField6 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField6.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField6.keyboardType = UIKeyboardTypeDefault;
    self.textField6.returnKeyType = UIReturnKeyDone;
    self.textField6.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField6];
    
    y += height + 10;
    
    
    UILabel *label7 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label7.font = font;
    label7.text = @"Revenus locatifs";
    label7.numberOfLines = 2;
    label7.backgroundColor = [UIColor clearColor];
    label7.textColor = [UIColor whiteColor];
    label7.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label7];
    
    self.textField7 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField7.font = font;
    self.textField7.text = @"0";
    [self.textField7 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField7.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField7.keyboardType = UIKeyboardTypeDefault;
    self.textField7.returnKeyType = UIReturnKeyDone;
    self.textField7.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField7];
    
    y += height + 10;
    
    UILabel *label8 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label8.font = font;
    label8.text = @"Autres revenus mensuels";
    label8.numberOfLines = 2;
    label8.backgroundColor = [UIColor clearColor];
    label8.textColor = [UIColor whiteColor];
    label8.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label8];
    
    self.textField8 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField8.font = font;
    self.textField8.text = @"0";
    [self.textField8 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField8.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField8.keyboardType = UIKeyboardTypeDefault;
    self.textField8.returnKeyType = UIReturnKeyDone;
    self.textField8.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField8];
    
    y += height + 10;
    
    
    UILabel *labelTitle2 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width + 60, height)];
    labelTitle2.font = font;
    labelTitle2.text = @"CHARGES MENTUELLES";
    labelTitle2.numberOfLines = 1;
    labelTitle2.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
    labelTitle2.backgroundColor = [UIColor clearColor];
    labelTitle2.textColor = UIColorFromRGB(0x414342);
    labelTitle2.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:labelTitle2];
    
    y += height + 10;
    
    UILabel *label9 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label9.font = font;
    label9.text = @"Emprunt immobilier";
    label9.numberOfLines = 2;
    label9.backgroundColor = [UIColor clearColor];
    label9.textColor = [UIColor whiteColor];
    label9.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label9];
    
    self.textField9 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField9.font = font;
    self.textField9.text = @"0";
    [self.textField9 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField9.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField9.keyboardType = UIKeyboardTypeDefault;
    self.textField9.returnKeyType = UIReturnKeyDone;
    self.textField9.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField9];
    
    y += height + 10;
    
    UILabel *label10 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label10.font = font;
    label10.text = @"Crédit voiture";
    label10.numberOfLines = 2;
    label10.backgroundColor = [UIColor clearColor];
    label10.textColor = [UIColor whiteColor];
    label10.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label10];
    
    self.textField10 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField10.font = font;
    self.textField10.text = @"0";
    [self.textField10 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField10.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField10.keyboardType = UIKeyboardTypeDefault;
    self.textField10.returnKeyType = UIReturnKeyDone;
    self.textField10.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField10];
    
    y += height + 10;
    
    UILabel *label11 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label11.font = font;
    label11.text = @"Autres crédits";
    label11.numberOfLines = 2;
    label11.backgroundColor = [UIColor clearColor];
    label11.textColor = [UIColor whiteColor];
    label11.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label11];
    
    self.textField11 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField11.font = font;
    self.textField11.text = @"0";
    [self.textField11 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField11.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField11.keyboardType = UIKeyboardTypeDefault;
    self.textField11.returnKeyType = UIReturnKeyDone;
    self.textField11.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField11];
    
    y += height + 10;
    
    UILabel *label12 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label12.font = font;
    label12.text = @"Loyers à payer";
    label12.numberOfLines = 2;
    label12.backgroundColor = [UIColor clearColor];
    label12.textColor = [UIColor whiteColor];
    label12.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label12];
    
    self.textField12 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField12.font = font;
    self.textField12.text = @"0";
    [self.textField12 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField12.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField12.keyboardType = UIKeyboardTypeDefault;
    self.textField12.returnKeyType = UIReturnKeyDone;
    self.textField12.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField12];
    
    y += height + 10;
    
    UILabel *label13 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label13.font = font;
    label13.text = @"Pension alimentaire";
    label13.numberOfLines = 2;
    label13.backgroundColor = [UIColor clearColor];
    label13.textColor = [UIColor whiteColor];
    label13.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label13];
    
    self.textField13 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField13.font = font;
    self.textField13.text = @"0";
    [self.textField13 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField13.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField13.keyboardType = UIKeyboardTypeDefault;
    self.textField13.returnKeyType = UIReturnKeyDone;
    self.textField13.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField13];
    
    y += height + 10;
    
    UILabel *label14 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label14.font = font;
    label14.text = @"Prêt immo. locatif";
    label14.numberOfLines = 2;
    label14.backgroundColor = [UIColor clearColor];
    label14.textColor = [UIColor whiteColor];
    label14.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label14];
    
    self.textField14 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField14.font = font;
    
    [self.textField14 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField14.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField14.keyboardType = UIKeyboardTypeDefault;
    self.textField14.returnKeyType = UIReturnKeyDone;
    self.textField14.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField14];
    
    y += height + 10;
    
    UILabel *label15 = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label15.font = font;
    label15.text = @"Autres charges";
    label15.numberOfLines = 2;
    label15.backgroundColor = [UIColor clearColor];
    label15.textColor = [UIColor whiteColor];
    label15.textAlignment = NSTextAlignmentLeft;
    [self.scrollView addSubview:label15];
    
    self.textField15 = [[UITextField alloc] initWithFrame:CGRectMake(scrollWidth - width - 10, y, width, height)];
    self.textField15.font = font;
    self.textField15.text = @"0";
    [self.textField15 setBorderStyle:UITextBorderStyleRoundedRect];
    self.textField15.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField15.keyboardType = UIKeyboardTypeDefault;
    self.textField15.returnKeyType = UIReturnKeyDone;
    self.textField15.textColor = UIColorFromRGB(0xfd8355);
    [self.scrollView addSubview:self.textField15];
    
    y += height + 10;
    
    self.scrollView.contentSize = CGSizeMake(scrollWidth, y);
}

- (IBAction)showNextView:(id)sender {
    [self.delegate goToExpressCreditStep4View];
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToExpressCreditStep2View];
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
