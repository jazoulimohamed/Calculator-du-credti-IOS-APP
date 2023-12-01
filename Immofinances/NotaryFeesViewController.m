//
//  NotaryFeesViewController.m
//  Immofinances
//
//  Created by Aminowizc on 13/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "NotaryFeesViewController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@interface NotaryFeesViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *transparentView;
@property (weak, nonatomic) IBOutlet UIButton *selectProjectButton;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (retain, nonatomic) UIPickerView *selectProjectPickerView;
@property (retain, nonatomic) UIPickerView *pickerView1;
@property (retain, nonatomic) UIPickerView *pickerView2;
@property (retain, nonatomic) NSMutableArray *projectTypesArray;
@property (retain, nonatomic) NSMutableArray *pickerValuesArray;
@property (retain, nonatomic) NSString *selectedProject;
@property (retain, nonatomic) NSString *selectedValue1;
@property (retain, nonatomic) NSString *selectedValue2;
@property (retain, nonatomic) NotaryFeesView1Controller *notaryFeesView1Controller;
@property (retain, nonatomic) NotaryFeesView2Controller *notaryFeesView2Controller;
@property (retain, nonatomic) NotaryFeesView3Controller *notaryFeesView3Controller;
@property (retain, nonatomic) NotaryFeesView4Controller *notaryFeesView4Controller;
@property (retain, nonatomic) NotaryFeesView5Controller *notaryFeesView5Controller;

@property int _type;
@property (retain, nonatomic) NSDictionary *_brm;
@property (retain, nonatomic) NSMutableArray *_s1;
@property (retain, nonatomic) NSMutableArray *_s2;
@property double _immo_size_value;
@property double _immo_size_value2;

@end

@implementation NotaryFeesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // Init the data array.
    self.projectTypesArray = [[NSMutableArray alloc] init];
    
    self._type = 1;
    self._immo_size_value = 1;
    self._immo_size_value2 = 1;
    [self initialiseBarem];
    
    // Add some data for demo purposes.
    [self.projectTypesArray addObject:@"Terrain + construction"];
    [self.projectTypesArray addObject:@"Logement neuf VEFA"];
    [self.projectTypesArray addObject:@"Log. neuf clé en main"];
    [self.projectTypesArray addObject:@"Logement ancien"];
    [self.projectTypesArray addObject:@"Travaux seul"];
    
    // Init the data array.
    self.pickerValuesArray = [[NSMutableArray alloc] init];
    
    // Add some data for demo purposes.
    [self.pickerValuesArray addObject:@"1 à 10 logements"];
    [self.pickerValuesArray addObject:@"11 à 24 logements"];
    [self.pickerValuesArray addObject:@"15 à 99 logements"];
    [self.pickerValuesArray addObject:@"100 et plus"];
    
    [self initializeComponents];
    
    self.notaryFeesView1Controller = [[NotaryFeesView1Controller alloc] initWithNibName:@"NotaryFeesView1" bundle:nil];
    self.notaryFeesView1Controller.delegate = self;
    self.notaryFeesView1Controller.view.frame = CGRectMake(0, 0, 320.00, self.notaryFeesView1Controller.view.bounds.size.height);
    
    self.notaryFeesView2Controller = [[NotaryFeesView2Controller alloc] initWithNibName:@"NotaryFeesView2" bundle:nil];
    self.notaryFeesView2Controller.delegate = self;
    if ([UIScreen mainScreen].bounds.size.width == 320.00){
        self.notaryFeesView2Controller.view.frame = CGRectMake(0, 0, 320.00, self.notaryFeesView2Controller.view.bounds.size.height);
    } else {
        self.notaryFeesView2Controller.view.frame = CGRectMake(0, 0, 375.00, self.notaryFeesView2Controller.view.bounds.size.height);
    }
    
    self.notaryFeesView3Controller = [[NotaryFeesView3Controller alloc] initWithNibName:@"NotaryFeesView3" bundle:nil];
    self.notaryFeesView3Controller.delegate = self;
    if ([UIScreen mainScreen].bounds.size.width == 320.00){
        self.notaryFeesView3Controller.view.frame = CGRectMake(0, 0, 320.00, self.notaryFeesView3Controller.view.bounds.size.height);
    } else {
        self.notaryFeesView3Controller.view.frame = CGRectMake(0, 0, 375.00, self.notaryFeesView3Controller.view.bounds.size.height);
    }
    
    self.notaryFeesView4Controller = [[NotaryFeesView4Controller alloc] initWithNibName:@"NotaryFeesView4" bundle:nil];
    self.notaryFeesView4Controller.delegate = self;
    if ([UIScreen mainScreen].bounds.size.width == 320.00){
        self.notaryFeesView4Controller.view.frame = CGRectMake(0, 0, 320.00, self.notaryFeesView4Controller.view.bounds.size.height);
    } else {
        self.notaryFeesView4Controller.view.frame = CGRectMake(0, 0, 375.00, self.notaryFeesView4Controller.view.bounds.size.height);
    }
    
    
    self.notaryFeesView5Controller = [[NotaryFeesView5Controller alloc] initWithNibName:@"NotaryFeesView5" bundle:nil];
    self.notaryFeesView5Controller.delegate = self;
    if ([UIScreen mainScreen].bounds.size.width == 320.00){
        self.notaryFeesView5Controller.view.frame = CGRectMake(0, 0, 320.00, self.notaryFeesView5Controller.view.bounds.size.height);
    } else {
        self.notaryFeesView5Controller.view.frame = CGRectMake(0, 0, 375.00, self.notaryFeesView5Controller.view.bounds.size.height);
    }
    
    [self.containerView addSubview:self.notaryFeesView1Controller.view];
}

- (void)initializeComponents {
    UIImage *btnImage = [UIImage imageNamed:@"BackButton"];
    [self.backButton setImage:btnImage forState:UIControlStateNormal];
    self.transparentView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.20];
    self.containerView.backgroundColor = [UIColorFromRGB(0xFFFFFF) colorWithAlphaComponent:0.0];
    
    //UIView *statusBar = (UIView *)[[UIApplication sharedApplication] valueForKey:@"statusBar"];
    //statusBar.backgroundColor = UIColorFromRGB(0x909090);
}

- (IBAction)showSelectProjectPickerView:(id)sender {
    self.selectProjectPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
    self.selectProjectPickerView.backgroundColor = [UIColor whiteColor];
    self.selectProjectPickerView.dataSource = self;
    self.selectProjectPickerView.delegate = self;
    self.selectProjectPickerView.showsSelectionIndicator = YES;
    [UIView animateWithDuration:0.30 animations:^{
        [self.selectProjectPickerView setFrame:CGRectMake(0, self.view.bounds.size.height - 180, self.view.bounds.size.width, 180)];
        [self.view addSubview:self.selectProjectPickerView];
    }];
    
}

- (void)showPickerView1 {
    NSLog(@"dsds");
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

- (void)showPickerView2 {
    NSLog(@"dsds");
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle the selection
    if (pickerView == self.selectProjectPickerView) {
        NSLog(@"%@", [self.projectTypesArray objectAtIndex:row]);
        self.selectedProject = [NSString stringWithFormat:@"%@", [self.projectTypesArray objectAtIndex:row]];
        self.selectProjectButton.titleLabel.text = self.selectedProject;
        if (row == 0) {
            self._type = 1;
            [self.containerView addSubview:self.notaryFeesView1Controller.view];
            [self.notaryFeesView2Controller.view removeFromSuperview];
            [self.notaryFeesView3Controller.view removeFromSuperview];
            [self.notaryFeesView4Controller.view removeFromSuperview];
            [self.notaryFeesView5Controller.view removeFromSuperview];
        } else if (row == 1) {
            self._type = 2;
            [self.containerView addSubview:self.notaryFeesView2Controller.view];
            [self.notaryFeesView1Controller.view removeFromSuperview];
            [self.notaryFeesView3Controller.view removeFromSuperview];
            [self.notaryFeesView4Controller.view removeFromSuperview];
            [self.notaryFeesView5Controller.view removeFromSuperview];
        } else if (row == 2) {
            self._type = 3;
            [self.containerView addSubview:self.notaryFeesView3Controller.view];
            [self.notaryFeesView1Controller.view removeFromSuperview];
            [self.notaryFeesView2Controller.view removeFromSuperview];
            [self.notaryFeesView4Controller.view removeFromSuperview];
            [self.notaryFeesView5Controller.view removeFromSuperview];
        } else if (row == 3) {
            self._type = 4;
            [self.containerView addSubview:self.notaryFeesView4Controller.view];
            [self.notaryFeesView1Controller.view removeFromSuperview];
            [self.notaryFeesView2Controller.view removeFromSuperview];
            [self.notaryFeesView3Controller.view removeFromSuperview];
            [self.notaryFeesView5Controller.view removeFromSuperview];
        } else if (row == 4) {
            self._type = 5;
            [self.containerView addSubview:self.notaryFeesView5Controller.view];
            [self.notaryFeesView1Controller.view removeFromSuperview];
            [self.notaryFeesView2Controller.view removeFromSuperview];
            [self.notaryFeesView3Controller.view removeFromSuperview];
            [self.notaryFeesView4Controller.view removeFromSuperview];
        }
    } else if (pickerView == self.pickerView1) {
        self.selectedValue1 = [NSString stringWithFormat:@"%@", [self.pickerValuesArray objectAtIndex:row]];
        NSLog(@"self.selectedValue1 %@", self.selectedValue1);
        self.notaryFeesView2Controller.buttonPicker.titleLabel.text = self.selectedValue1;
        self._immo_size_value = row + 1;
        [self estimateTotalValue];
    } else if (pickerView == self.pickerView2) {
        self.selectedValue2 = [NSString stringWithFormat:@"%@", [self.pickerValuesArray objectAtIndex:row]];
        NSLog(@"self.selectedValue2 %@", self.selectedValue2);
        self.notaryFeesView3Controller.buttonPicker.titleLabel.text = self.selectedValue2;
        self._immo_size_value2 = row + 1;
        [self estimateTotalValue];
    }
    
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.selectProjectPickerView) {
        return [self.projectTypesArray count];
    } else {
        return [self.pickerValuesArray count];
    }
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.selectProjectPickerView) {
        return [self.projectTypesArray objectAtIndex: row];
    } else {
        return [self.pickerValuesArray objectAtIndex: row];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    NSLog(@"Touch event");
    if ([touch view] != self.selectProjectButton) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.selectProjectPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.selectProjectPickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView1 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView1 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView2 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView2 removeFromSuperview];
        }];
    } else if ([touch view] != self.selectProjectPickerView) {
        [UIView animateWithDuration:0.30 animations:^{
            [self.selectProjectPickerView setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.selectProjectPickerView removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView1 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView1 removeFromSuperview];
        }];
        [UIView animateWithDuration:0.30 animations:^{
            [self.pickerView2 setFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, 180)];
            [self.pickerView2 removeFromSuperview];
        }];
    }
    [super touchesBegan:touches withEvent:event];
}

- (void)initialiseBarem {
    self._brm = [[NSDictionary alloc] init];
    self._s1 = [[NSMutableArray alloc] init];
    self._s2 = [[NSMutableArray alloc] init];
    
    self._brm = @{@"ModeCalculHypo": @"2.0",
                  @"TauxTva" : @"20.0",
                  @"ProportMini" : @"78.00",
                  @"EmolFixeAncien" : @"570.00",
                  @"EmolFixeNeufT" : @"370.00",
                  @"EmolFixePret" : @"180.00",
                  @"EmolFixePpd" : @"130.00",
                  @"DeboursAchat" : @"780.00",
                  @"DeboursPret" : @"40.00",
                  @"EnregFixe125" : @"125.00",
                  @"EnregFixe25" : @"25.00",
                  @"NegociePlafond" : @"45735.00",
                  @"NegocieTaux1" : @"5.0",
                  @"NegocieTaux2" : @"2.5",
                  @"SalaireMini1" : @"15.00",
                  @"SalaireMini2" : @"8.00",
                  @"SalaireTaux1" : @"0.10",
                  @"SalaireTaux2" : @"0.05",
                  @"TauxTD" : @"4.50",
                  @"TauxTC" : @"1.20",
                  @"TauxPF" : @"0.70",
                  @"TauxFA" : @"2.14",
                  @"TauxTE20" : @"0.20",
                  @"TauxTE10" : @"0.10"
                             };

    S *s1 = [[S alloc] init];
    s1.plafond = 6500.00;
    s1.taux = 4.000;
    
    S *s2 = [[S alloc] init];
    s2.plafond = 17000.00;
    s2.taux = 1.650;
    
    S *s3 = [[S alloc] init];
    s3.plafond = 60000.00;
    s3.taux = 1.100;
    
    S *s4 = [[S alloc] init];
    s4.plafond = 0.00;
    s4.taux = 0.825;
    
    [self._s1 addObject:s1];
    [self._s1 addObject:s2];
    [self._s1 addObject:s3];
    [self._s1 addObject:s4];
    
    S *s5 = [[S alloc] init];
    s5.plafond = 6500.00;
    s5.taux = 2.000;
    
    S *s6 = [[S alloc] init];
    s6.plafond = 17000.00;
    s6.taux = 1.100;
    
    S *s7 = [[S alloc] init];
    s7.plafond = 30000.00;
    s7.taux = 1.750;
    
    S *s8 = [[S alloc] init];
    s8.plafond = 0.00;
    s8.taux = 0.550;
    
    [self._s2 addObject:s5];
    [self._s2 addObject:s6];
    [self._s2 addObject:s7];
    [self._s2 addObject:s8];
    
}

- (double)calculFrais:(double)assiette type:(int)type IsNegociation:(bool)IsNegociation NbHabitation:(double)NbHabitation {
    double CoeffSerie;  // appliqué à s1,s2 : 1/3, 2/3 ...
    double tempd;
    double FraisNotaire=0;
    if(type!=1 && type!=2 && type!=3 && type!=4)
    { return(FraisNotaire);
    }
    if(assiette<=0)
    { return(FraisNotaire);
    }
    if(type==2 || type==3) // NEUF
    {
        if(NbHabitation<=10) CoeffSerie=1.0;
        else if(NbHabitation<25 ) CoeffSerie=4.0/5.0;
        else if(NbHabitation<100) CoeffSerie=2.0/3.0;
        else if(NbHabitation<250) CoeffSerie=1.0/2.0;
        else if(NbHabitation<500) CoeffSerie=2.0/5.0;
        else            CoeffSerie=1.0/3.0;
    }
    else{ CoeffSerie=1.0;
    }
    double emolument=[self emolFromSerie:assiette NumSerie:1 coeff:CoeffSerie];
    emolument+=(type==1 || type==2 || type==3)
    ? [[self._brm objectForKey:@"EmolFixeNeufT"] doubleValue]
    : [[self._brm objectForKey:@"EmolFixeAncien"] doubleValue];
    if(IsNegociation)
    {
        if(assiette<=[[self._brm objectForKey:@"NegociePlafond"] doubleValue])
        { tempd=assiette*([[self._brm objectForKey:@"NegocieTaux1"] doubleValue]/100);
        }
        else{ tempd=[[self._brm objectForKey:@"NegociePlafond"] doubleValue];
            tempd=(tempd*([[self._brm objectForKey:@"NegocieTaux1"] doubleValue]/100))
            +((assiette-tempd)*([[self._brm objectForKey:@"NegocieTaux2"] doubleValue]/100));
        }
        emolument+=tempd;
    }
    double debours=[[self._brm objectForKey:@"DeboursAchat"] doubleValue];
    tempd=assiette*([[self._brm objectForKey:@"SalaireTaux1"] doubleValue]/100);
                   if(tempd<[[self._brm objectForKey:@"SalaireMini1"] doubleValue]) tempd=[[self._brm objectForKey:@"SalaireMini1"] doubleValue];
    debours+=tempd;
    double tva1=emolument*([[self._brm objectForKey:@"TauxTva"] doubleValue]/100);
    double enreg=0;
    if(type==1 || type==4) // TERRAIN ou ANCIEN
    {
        double TauxTD=[[self._brm objectForKey:@"TauxTD"] doubleValue]*(1+([[self._brm objectForKey:@"TauxFA"] doubleValue]/100));
        enreg=assiette*((TauxTD+[[self._brm objectForKey:@"TauxTC"] doubleValue]+[[self._brm objectForKey:@"TauxTE20"] doubleValue])/100);
    }
    else
        if(type==2 || type==3)
        {
            double TauxPF=[[self._brm objectForKey:@"TauxPF"] doubleValue]*(1+([[self._brm objectForKey:@"TauxFA"] doubleValue]/100));
            enreg=assiette*((TauxPF+[[self._brm objectForKey:@"TauxTE10"] doubleValue])/100);
        }
    tempd=emolument+debours+enreg+tva1;
    FraisNotaire=floor(tempd/10)*10; // arrondi a 10 Euro
    return(FraisNotaire);
}
    
- (double)calculHypo:(double) Pth PcPel:(double)PcPel PasPtz:(double)PasPtz PpdMax:(double)PpdMax {
    double tempd;
    double FraisNotaire=0;
    double TotalPret=Pth+PcPel+PasPtz;
    if(TotalPret<=0)
    { return(FraisNotaire);
    }
    if(PpdMax<=0) PpdMax=0;
    double emolument;
    emolument=[self emolFromSerie:TotalPret NumSerie:1 coeff:1.0/3.0];
    emolument+=(PcPel>0 || PasPtz>0 || Pth>PpdMax)
    ? [[self._brm objectForKey:@"EmolFixePret"] doubleValue]
    : [[self._brm objectForKey:@"EmolFixePpd"] doubleValue];
    double enreg=0;
    if(Pth>PpdMax)
    {
        double TauxPF=[[self._brm objectForKey:@"TauxPF"] doubleValue]*(1+([[self._brm objectForKey:@"TauxFA"] doubleValue]/100));
        enreg=(((Pth-PpdMax)*1.20)*((TauxPF+[[self._brm objectForKey:@"TauxTE10"] doubleValue])/100));
    }
    if(PcPel>0 || PasPtz>0 || Pth>PpdMax)
    { enreg+=[[self._brm objectForKey:@"EnregFixe125"] doubleValue];
    }
    double debours=[[self._brm objectForKey:@"DeboursPret"] doubleValue];
    tempd=TotalPret;
    if(tempd>0)
    { tempd*=1.20*([[self._brm objectForKey:@"SalaireTaux2"] doubleValue]/100);
        if(tempd<[[self._brm objectForKey:@"SalaireMini2"] doubleValue]) tempd=[[self._brm objectForKey:@"SalaireMini2"] doubleValue];
        debours+=tempd;
    }
    double tva1=emolument*([[self._brm objectForKey:@"TauxTva"] doubleValue]/100);
    tempd=emolument+debours+enreg+tva1;
    FraisNotaire=floor(tempd/5)*5; // arrondi a 5 euro
    return(FraisNotaire);
}

- (double)emolFromSerie:(double)assiette NumSerie:(int)NumSerie coeff:(double)coeff {
    double emolument=0;
    if(assiette>0)
    {
        NSMutableArray *serie = [[NSMutableArray alloc] init];
        serie=(NumSerie==2) ? self._s2 : self._s1;
        for(int num=0; ; num++)
        {
            double plafond=[[serie objectAtIndex:num] plafond];
            double tempd=(plafond!=0 && assiette>plafond) ? plafond : assiette;
            if(num>0) tempd-=[[serie objectAtIndex:num-1] plafond];
            emolument+=tempd*([[serie objectAtIndex:num] taux]/100);
            if(plafond==0 || assiette<=plafond) break;
        }
        emolument*=coeff;
        if(emolument<[[self._brm objectForKey:@"ProportMini"] doubleValue])
        { emolument=[[self._brm objectForKey:@"ProportMini"] doubleValue];
        }
    }
    return(emolument);
}

- (void)estimateTotalValue {
    
    double landPrice = 0; // Terrain
    double livingPrice = 0; // Logement
    double borrowingAmount = 0; // Pret
    double additionalWorks = 0; // Travaux
    bool isNegocie = false; // IsNegocie
    bool nbHabitation = 0; // IsNegocie
    
    //_immo_size_value // NbLogement
    //_immo_size_value2 // NbLogement
    
    if (self._type == 1) {
        landPrice = [[self.notaryFeesView1Controller.textField1 text] doubleValue];
        livingPrice = [[self.notaryFeesView1Controller.textField2 text] doubleValue];
        borrowingAmount = [[self.notaryFeesView1Controller.textField3 text] doubleValue];
    } else if (self._type == 2) {
        livingPrice = [[self.notaryFeesView2Controller.textField1 text] doubleValue];
        borrowingAmount = [[self.notaryFeesView2Controller.textField2 text] doubleValue];
        nbHabitation = self._immo_size_value;
        //_immo_size_value
        
    } else if (self._type == 3) {
        livingPrice =  [[self.notaryFeesView3Controller.textField1 text] doubleValue];
        borrowingAmount = [[self.notaryFeesView3Controller.textField2 text] doubleValue];
        nbHabitation = self._immo_size_value2;
        //
        
    } else if (self._type == 4) {
        additionalWorks = [[self.notaryFeesView4Controller.textField1 text] doubleValue];
        livingPrice = [[self.notaryFeesView4Controller.textField2 text] doubleValue];
        borrowingAmount = [[self.notaryFeesView4Controller.textField3 text] doubleValue];
        
    } else if (self._type == 5) {
        additionalWorks = [[self.notaryFeesView5Controller.textField2 text] doubleValue];
        borrowingAmount = [[self.notaryFeesView5Controller.textField3 text] doubleValue];
    }
    
    NSString *error = @"";
    
    if(self._type < 1 || self._type > 5) {
        error = @"Précisez le type d'acquisition !";
    } else if(landPrice < 0) {
        error = @"Cout du terrain : saisie invalide" ;
    } else  if(livingPrice < 0) {
        error = @"Cout du logement : saisie invalide";
    } else if(additionalWorks < 0) {
        error = @"Cout des travaux : saisie invalide";
    } else if(borrowingAmount < 0) {
        error = @"Montant du prêt : saisie invalide" ;
    } else if(self._type == 1 && (landPrice == 0 && livingPrice == 0)) {
        error = @"Précisez le coût du terrain et/ou du logement !";
    } else if((self._type == 2 || self._type == 3) && livingPrice <= 0) {
        error = @"Précisez le coût du logement !";
    } else if(self._type == 4 && (livingPrice == 0 && additionalWorks == 0)) {
        error = @"Précisez le coût du logement et/ou des travaux !";
    }

    if ([error isEqualToString:@""]) {
        if(self._type > 0) {
            double CoutAchat = (self._type == 1) ? landPrice : livingPrice;
            if(CoutAchat > 0) {
                isNegocie = false;
                double total = [self calculFrais:CoutAchat type:self._type IsNegociation:isNegocie NbHabitation:nbHabitation];
                if (self._type == 1) [self.notaryFeesView1Controller.totalTextField1 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 2) [self.notaryFeesView2Controller.totalTextField1 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 3) [self.notaryFeesView3Controller.totalTextField1 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 4) [self.notaryFeesView4Controller.totalTextField1 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 5) [self.notaryFeesView5Controller.totalTextField1 setText:[NSString stringWithFormat:@"%.2f", total]];
            }
            if (borrowingAmount > 0) {
                double PpdMax = 0;
                if(self._type == 1) {
                    PpdMax = landPrice;
                }
                else if (self._type == 3 || // neuf cle en main
                         self._type == 4)   // ancien
                {
                    PpdMax = livingPrice;
                }
                double total = [self calculHypo:borrowingAmount PcPel:0 PasPtz:0 PpdMax:PpdMax];
                if (self._type == 1) [self.notaryFeesView1Controller.totalTextField2 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 2) [self.notaryFeesView2Controller.totalTextField2 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 3) [self.notaryFeesView3Controller.totalTextField2 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 4) [self.notaryFeesView4Controller.totalTextField2 setText:[NSString stringWithFormat:@"%.2f", total]];
                else if (self._type == 5) [self.notaryFeesView5Controller.totalTextField2 setText:[NSString stringWithFormat:@"%.2f", total]];
            }
        }
    } else {
        [self showMessage:error withTitle:@"Erreur"];
    }
}

- (void)showMessage:(NSString*)message withTitle:(NSString *)title {
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        //do something when click button
    }];
    [alert addAction:okAction];
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}

- (IBAction)returnToHomeViewFromNotaryFeesView:(id)sender {
    [self.delegate returnToHomeViewFromNotaryFeesView];
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
