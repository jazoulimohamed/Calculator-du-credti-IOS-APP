//
//  ExpressCreditStep6ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ExpressCreditStep6ViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface ExpressCreditStep6ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UITextField *occupationTextField;
@property (weak, nonatomic) IBOutlet UITextField *seniorityTextField;
@property (weak, nonatomic) IBOutlet UIButton *youAreButton;
@property (weak, nonatomic) IBOutlet UIButton *contractButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *validateButton;
@property (retain, nonatomic) UIPickerView *youArePickerView;
@property (retain, nonatomic) UIPickerView *contractPickerView;
@property (retain, nonatomic) NSMutableArray *youAreArray;
@property (retain, nonatomic) NSMutableArray *contractArray;
@property (retain, nonatomic) NSString *youAre;
@property (retain, nonatomic) NSString *contract;

@end

@implementation ExpressCreditStep6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.youAreArray = [[NSMutableArray alloc] init];
    self.contractArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.youAreArray addObject:@"Artisan"];
    [self.youAreArray addObject:@"Agent de maîtrise"];
    [self.youAreArray addObject:@"Assimilé cadre"];
    [self.youAreArray addObject:@"Autre"];
    [self.youAreArray addObject:@"Cadre"];
    [self.youAreArray addObject:@"Commerçant"];
    [self.youAreArray addObject:@"Demandeur d'emploi"];
    [self.youAreArray addObject:@"Dirigeant"];
    [self.youAreArray addObject:@"Employé"];
    [self.youAreArray addObject:@"Etudiant"];
    [self.youAreArray addObject:@"Exploitant agricole"];
    [self.youAreArray addObject:@"Fonctionnaire"];
    [self.youAreArray addObject:@"Homme / Femme au foyer"];
    [self.youAreArray addObject:@"Intermittant"];
    [self.youAreArray addObject:@"Militaire"];
    [self.youAreArray addObject:@"Ouvrier"];
    [self.youAreArray addObject:@"Profession libérale"];
    [self.youAreArray addObject:@"Retraité (Cadre ou assimilé)"];
    [self.youAreArray addObject:@"Retraité (Autres)"];
    [self.youAreArray addObject:@"Sans activité"];
    [self.youAreArray addObject:@"Sans profession"];
    
    [self.contractArray addObject:@"Autre"];
    [self.contractArray addObject:@"CDD"];
    [self.contractArray addObject:@"CDI (essai terminé)"];
    [self.contractArray addObject:@"CDI (essai en cours)"];
    [self.contractArray addObject:@"Gérant de société salarié"];
    [self.contractArray addObject:@"Gérant de société non salarié"];
    [self.contractArray addObject:@"Intérimaire"];
    [self.contractArray addObject:@"Intermittant de spectacle"];
    [self.contractArray addObject:@"Inactifs avec revenus"];
    [self.contractArray addObject:@"Inactifs sans revenus"];
    [self.contractArray addObject:@"Invalide / Handicapé"];
    [self.contractArray addObject:@"Retraité / Pré-retraite"];
    [self.contractArray addObject:@"RMI / RSA"];
    [self.contractArray addObject:@"Saisonnier"];
    [self.contractArray addObject:@"Sans profession"];
    [self.contractArray addObject:@"Travailleur non salarié"];
    
    [self initializeComponents];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
    
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonNormal"] forState:UIControlStateNormal];
    [self.previousButton setImage:[UIImage imageNamed:@"PreviousButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
    
    [self.validateButton setImage:[UIImage imageNamed:@"ValidateButtonNormal"] forState:UIControlStateNormal];
    [self.validateButton setImage:[UIImage imageNamed:@"ValidateButtonPressed"] forState:UIControlStateSelected | UIControlStateHighlighted];
}

- (IBAction)seniorityChoice:(id)sender {
    UIButton *someButton = (UIButton*)sender;
    NSLog(@"The button title is %@ ", [someButton titleForState:UIControlStateNormal]);
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

- (IBAction)contractType:(id)sender {
    self.contractPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.contractPickerView.backgroundColor = [UIColor whiteColor];
    self.contractPickerView.dataSource = self;
    self.contractPickerView.delegate = self;
    self.contractPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.contractPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.contractPickerView];
    }];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    if (pickerView == self.youArePickerView) {
        self.youAre = [NSString stringWithFormat:@"%@", [self.youAreArray objectAtIndex:row]];
        self.youAreButton.titleLabel.text = self.youAre;
    } else if (pickerView == self.contractPickerView) {
        self.contract = [NSString stringWithFormat:@"%@", [self.contractArray objectAtIndex:row]];
        self.contractButton.titleLabel.text = self.contract;
    }
    
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.youArePickerView) {
        return [self.youAreArray count];
    } else if (pickerView == self.contractPickerView) {
        return [self.contractArray count];
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
    if (pickerView == self.youArePickerView) {
        return [self.youAreArray objectAtIndex: row];
    } else if (pickerView == self.contractPickerView) {
        return [self.contractArray objectAtIndex: row];
    } else {
        return @"";
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.youAreButton || [touch view] != self.contractButton) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.youArePickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.youArePickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.contractPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.contractPickerView removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)validateFrom:(id)sender {
    
}

- (IBAction)showPreviousView:(id)sender {
    [self.delegate returnToExpressCreditStep5View];
}

- (IBAction)returnToExpressCreditStep5FromExpressCreditStep6View:(id)sender {
    [self.delegate returnToExpressCreditStep5View];
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

