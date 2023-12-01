//
//  ExpressCreditView4Controller.m
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ExpressCreditView4Controller.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ExpressCreditView4Controller ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *lastnameTextView;
@property (weak, nonatomic) IBOutlet UITextField *daughterFirstnameTextView;
@property (weak, nonatomic) IBOutlet UITextField *firstnameTextView;
@property (weak, nonatomic) IBOutlet UITextField *birthdateTextView;
@property (weak, nonatomic) IBOutlet UITextField *birthplaceTextView;
@property (weak, nonatomic) IBOutlet UITextField *nationalityTextView;
@property (weak, nonatomic) IBOutlet UITextField *childrenNumberTextView;
@property (weak, nonatomic) IBOutlet UIButton *situationButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (retain, nonatomic) UIDatePicker *birthdayDatePicker;
@property (retain, nonatomic) UIPickerView *situationPickerView;
@property (retain, nonatomic) NSMutableArray *situationArray;
@property (retain, nonatomic) NSString *situation;

@end

@implementation ExpressCreditView4Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
