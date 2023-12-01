//
//  ViewController.m
//  Immofinances
//
//  Created by Aminowizc on 06/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "News.h"

@interface ViewController ()

@property (retain, nonatomic) HomeViewController *homeViewController;
@property (retain, nonatomic) RateDetailsViewController *rateDetailsViewController;
@property (retain, nonatomic) MonthlyPaymentViewController *monthlyPaymentViewController;
@property (retain, nonatomic) BorrowingCapacityViewController *borrowingCapacityViewController;
@property (retain, nonatomic) RepaymentPeriodViewController *repaymentPeriodViewController;
@property (retain, nonatomic) BarometerViewController *barometerViewController;
@property (retain, nonatomic) NotaryFeesViewController *notaryFeesViewController;
@property (retain, nonatomic) CreditExpressViewController *creditExpressViewController;
@property (retain, nonatomic) InsuranceComparatorViewController *insuranceComparatorViewController;
@property (retain, nonatomic) InsurancesComparatorStep1ViewController *insurancesComparatorStep1ViewController;
@property (retain, nonatomic) InsurancesComparatorStep2ViewController *insurancesComparatorStep2ViewController;
@property (retain, nonatomic) InsurancesComparatorStep3ViewController *insurancesComparatorStep3ViewController;
@property (retain, nonatomic) InsurancesComparatorStep4ViewController *insurancesComparatorStep4ViewController;
@property (retain, nonatomic) ExpressCreditStep1ViewController *expressCreditStep1ViewController;
@property (retain, nonatomic) ExpressCreditStep2ViewController *expressCreditStep2ViewController;
@property (retain, nonatomic) ExpressCreditStep3ViewController *expressCreditStep3ViewController;
@property (retain, nonatomic) ExpressCreditStep4ViewController *expressCreditStep4ViewController;
@property (retain, nonatomic) ExpressCreditStep5ViewController *expressCreditStep5ViewController;
@property (retain, nonatomic) ExpressCreditStep6ViewController *expressCreditStep6ViewController;
@property (retain, nonatomic) PersonalAreaViewController *personalAreaViewController;
@property (retain, nonatomic) ContactViewController *contactViewController;
@property (retain, nonatomic) NewsViewController *newsViewController;
@property (retain, nonatomic) MBProgressHUD *hud;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self showHomeView];
}

- (void)showHomeView {
    self.homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeView" bundle:nil];
    self.homeViewController.delegate = self;
    self.homeViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.homeViewController.view];
}

- (void)showRateDetailsView {
    /*self.rateDetailsViewController = [[RateDetailsViewController alloc] initWithNibName:@"RateDetailsView" bundle:nil];
    self.rateDetailsViewController.delegate = self;
    self.rateDetailsViewController.view.frame = self.view.bounds;
    [self animateView:self.rateDetailsViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];*/
    [self getMeteoValues];
}

- (void)returnToHomeViewFromRateDetailsView {
    [self animateView:self.homeViewController.view currentView:self.rateDetailsViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showMonthlyPaymentsView {
    self.monthlyPaymentViewController = [[MonthlyPaymentViewController alloc] initWithNibName:@"MonthlyPaymentView" bundle:nil];
    self.monthlyPaymentViewController.delegate = self;
    self.monthlyPaymentViewController.view.frame = self.view.bounds;
    [self animateView:self.monthlyPaymentViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromMonthlyPaymentView {
    [self animateView:self.homeViewController.view currentView:self.monthlyPaymentViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showBorrowingCapacityView {
    self.borrowingCapacityViewController = [[BorrowingCapacityViewController alloc] initWithNibName:@"BorrowingCapacityView" bundle:nil];
    self.borrowingCapacityViewController.delegate = self;
    self.borrowingCapacityViewController.view.frame = self.view.bounds;
    [self animateView:self.borrowingCapacityViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromBorrowingCapacityView {
    [self animateView:self.homeViewController.view currentView:self.borrowingCapacityViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showRepaymentDurationView {
    self.repaymentPeriodViewController = [[RepaymentPeriodViewController alloc] initWithNibName:@"RepaymentPeriodView" bundle:nil];
    self.repaymentPeriodViewController.delegate = self;
    self.repaymentPeriodViewController.view.frame = self.view.bounds;
    [self animateView:self.repaymentPeriodViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromRepaymentPeriodView {
    [self animateView:self.homeViewController.view currentView:self.repaymentPeriodViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showBarometerView {
    [self getBarometerValues];
    /*self.barometerViewController = [[BarometerViewController alloc] initWithNibName:@"BarometerView" bundle:nil];
    self.barometerViewController.delegate = self;
    self.barometerViewController.view.frame = self.view.bounds;
    [self animateView:self.barometerViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];*/
}

- (void)returnToHomeViewFromBarometerView {
    [self animateView:self.homeViewController.view currentView:self.barometerViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showNotaryFeesView {
    self.notaryFeesViewController = [[NotaryFeesViewController alloc] initWithNibName:@"NotaryFeesView" bundle:nil];
    self.notaryFeesViewController.delegate = self;
    self.notaryFeesViewController.view.frame = self.view.bounds;
    [self animateView:self.notaryFeesViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromNotaryFeesView {
    [self animateView:self.homeViewController.view currentView:self.notaryFeesViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showInsurancesComparatorStep1View {
    self.insuranceComparatorViewController = [[InsuranceComparatorViewController alloc] initWithNibName:@"InsuranceComparatorView" bundle:nil];
    self.insuranceComparatorViewController.delegate = self;
    self.insuranceComparatorViewController.view.frame = self.view.bounds;
    [self animateView:self.insuranceComparatorViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromInsuranceComparatorView {
    [self animateView:self.homeViewController.view currentView:self.insuranceComparatorViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)goToInsurancesComparatorStep2View {
    self.insurancesComparatorStep2ViewController = [[InsurancesComparatorStep2ViewController alloc] initWithNibName:@"InsurancesComparatorStep2View" bundle:nil];
    self.insurancesComparatorStep2ViewController.delegate = self;
    self.insurancesComparatorStep2ViewController.view.frame = self.view.bounds;
    [self animateView:self.insurancesComparatorStep2ViewController.view currentView:self.insurancesComparatorStep1ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromInsurancesComparatorStep1View {
    [self animateView:self.homeViewController.view currentView:self.insurancesComparatorStep1ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)goToInsurancesComparatorStep3View {
    self.insurancesComparatorStep3ViewController = [[InsurancesComparatorStep3ViewController alloc] initWithNibName:@"InsurancesComparatorStep3View" bundle:nil];
    self.insurancesComparatorStep3ViewController.delegate = self;
    self.insurancesComparatorStep3ViewController.view.frame = self.view.bounds;
    [self animateView:self.insurancesComparatorStep3ViewController.view currentView:self.insurancesComparatorStep2ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToInsurancesComparatorStep1View {
    [self animateView:self.insurancesComparatorStep1ViewController.view currentView:self.insurancesComparatorStep2ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)goToInsurancesComparatorStep4View {
    self.insurancesComparatorStep4ViewController = [[InsurancesComparatorStep4ViewController alloc] initWithNibName:@"InsurancesComparatorStep4View" bundle:nil];
    self.insurancesComparatorStep4ViewController.delegate = self;
    [self animateView:self.insurancesComparatorStep4ViewController.view currentView:self.insurancesComparatorStep3ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToInsurancesComparatorStep2View {
    [self animateView:self.insurancesComparatorStep2ViewController.view currentView:self.insurancesComparatorStep3ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)returnToInsurancesComparatorStep3View {
    [self animateView:self.insurancesComparatorStep3ViewController.view currentView:self.insurancesComparatorStep4ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

/*- (void)showInsurancesComparatorStep2View {
    self.insurancesComparatorStep2ViewController = [[InsurancesComparatorStep2ViewController alloc] initWithNibName:@"InsurancesComparatorStep2View" bundle:nil];
    //self.insurancesComparatorStep2ViewController.delegate = self;
    self.insurancesComparatorStep2ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.insurancesComparatorStep2ViewController.view];
}

- (void)showInsurancesComparatorStep3View {
    self.insurancesComparatorStep3ViewController = [[InsurancesComparatorStep3ViewController alloc] initWithNibName:@"InsurancesComparatorStep3View" bundle:nil];
    //self.insurancesComparatorStep3ViewController.delegate = self;
    self.insurancesComparatorStep3ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.insurancesComparatorStep3ViewController.view];
}

- (void)showInsurancesComparatorStep4View {
    self.insurancesComparatorStep4ViewController = [[InsurancesComparatorStep4ViewController alloc] initWithNibName:@"InsurancesComparatorStep4View" bundle:nil];
    //self.insurancesComparatorStep4ViewController.delegate = self;
    self.insurancesComparatorStep4ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.insurancesComparatorStep4ViewController.view];
}*/

- (void)showExpressCreditStep1View {
    self.creditExpressViewController = [[CreditExpressViewController alloc] initWithNibName:@"CreditExpressView" bundle:nil];
    self.creditExpressViewController.delegate = self;
    self.creditExpressViewController.view.frame = self.view.bounds;
    [self animateView:self.creditExpressViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromCreditExpressView {
    [self animateView:self.homeViewController.view currentView:self.creditExpressViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)goToExpressCreditStep2View {
    self.expressCreditStep2ViewController = [[ExpressCreditStep2ViewController alloc] initWithNibName:@"ExpressCreditStep2View" bundle:nil];
    self.expressCreditStep2ViewController.delegate = self;
    self.expressCreditStep2ViewController.view.frame = self.view.bounds;
    [self animateView:self.expressCreditStep2ViewController.view currentView:self.expressCreditStep1ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)goToExpressCreditStep3View {
    self.expressCreditStep3ViewController = [[ExpressCreditStep3ViewController alloc] initWithNibName:@"ExpressCreditStep3View" bundle:nil];
    self.expressCreditStep3ViewController.delegate = self;
    self.expressCreditStep3ViewController.view.frame = self.view.bounds;
    [self animateView:self.expressCreditStep3ViewController.view currentView:self.expressCreditStep2ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)goToExpressCreditStep4View {
    self.expressCreditStep4ViewController = [[ExpressCreditStep4ViewController alloc] initWithNibName:@"ExpressCreditStep4View" bundle:nil];
    self.expressCreditStep4ViewController.delegate = self;
    self.expressCreditStep4ViewController.view.frame = self.view.bounds;
    [self animateView:self.expressCreditStep4ViewController.view currentView:self.expressCreditStep3ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)goToExpressCreditStep5View {
    self.expressCreditStep5ViewController = [[ExpressCreditStep5ViewController alloc] initWithNibName:@"ExpressCreditStep5View" bundle:nil];
    self.expressCreditStep5ViewController.delegate = self;
    self.expressCreditStep5ViewController.view.frame = self.view.bounds;
    [self animateView:self.expressCreditStep5ViewController.view currentView:self.expressCreditStep4ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)goToExpressCreditStep6View {
    self.expressCreditStep6ViewController = [[ExpressCreditStep6ViewController alloc] initWithNibName:@"ExpressCreditStep6View" bundle:nil];
    self.expressCreditStep6ViewController.delegate = self;
    self.expressCreditStep6ViewController.view.frame = self.view.bounds;
    [self animateView:self.expressCreditStep6ViewController.view currentView:self.expressCreditStep5ViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromExpressCreditStep1View {
    [self animateView:self.homeViewController.view currentView:self.expressCreditStep1ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)returnToExpressCreditStep1View {
    [self animateView:self.expressCreditStep1ViewController.view currentView:self.expressCreditStep2ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)returnToExpressCreditStep2View {
    [self animateView:self.expressCreditStep2ViewController.view currentView:self.expressCreditStep3ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)returnToExpressCreditStep3View {
    [self animateView:self.expressCreditStep3ViewController.view currentView:self.expressCreditStep4ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)returnToExpressCreditStep4View {
    [self animateView:self.expressCreditStep4ViewController.view currentView:self.expressCreditStep5ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)returnToExpressCreditStep5View {
    [self animateView:self.expressCreditStep5ViewController.view currentView:self.expressCreditStep6ViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

/*- (void)showExpressCreditStep1View {
    self.expressCreditStep1ViewController = [[ExpressCreditStep1ViewController alloc] initWithNibName:@"ExpressCreditStep1View" bundle:nil];
    //self.expressCreditStep1ViewController.delegate = self;
    self.expressCreditStep1ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.expressCreditStep1ViewController.view];
}

- (void)showExpressCreditStep2View {
    self.expressCreditStep2ViewController = [[ExpressCreditStep2ViewController alloc] initWithNibName:@"ExpressCreditStep2View" bundle:nil];
    //self.expressCreditStep2ViewController.delegate = self;
    self.expressCreditStep2ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.expressCreditStep2ViewController.view];
}

- (void)showExpressCreditStep3View {
    self.expressCreditStep3ViewController = [[ExpressCreditStep3ViewController alloc] initWithNibName:@"ExpressCreditStep3View" bundle:nil];
    //self.expressCreditStep3ViewController.delegate = self;
    self.expressCreditStep3ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.expressCreditStep3ViewController.view];
}


- (void)showExpressCreditStep4View {
    self.expressCreditStep4ViewController = [[ExpressCreditStep4ViewController alloc] initWithNibName:@"ExpressCreditStep4View" bundle:nil];
    //self.expressCreditStep4ViewController.delegate = self;
    self.expressCreditStep4ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.expressCreditStep4ViewController.view];
}

- (void)showExpressCreditStep5View {
    self.expressCreditStep5ViewController = [[ExpressCreditStep5ViewController alloc] initWithNibName:@"ExpressCreditStep5View" bundle:nil];
    //self.expressCreditStep5ViewController.delegate = self;
    self.expressCreditStep5ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.expressCreditStep5ViewController.view];
}

- (void)showExpressCreditStep6View {
    self.expressCreditStep6ViewController = [[ExpressCreditStep6ViewController alloc] initWithNibName:@"ExpressCreditStep6View" bundle:nil];
    //self.expressCreditStep6ViewController.delegate = self;
    self.expressCreditStep6ViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.expressCreditStep6ViewController.view];
}*/

- (void)showPersonalAreaView {
    self.personalAreaViewController = [[PersonalAreaViewController alloc] initWithNibName:@"PersonalAreaView" bundle:nil];
    self.personalAreaViewController.delegate = self;
    self.personalAreaViewController.view.frame = self.view.bounds;
    [self animateView:self.personalAreaViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromPersonalAreaView {
    [self animateView:self.homeViewController.view currentView:self.personalAreaViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showContactView {
    self.contactViewController = [[ContactViewController alloc] initWithNibName:@"ContactView" bundle:nil];
    self.contactViewController.delegate = self;
    self.contactViewController.view.frame = self.view.bounds;
    [self animateView:self.contactViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
}

- (void)returnToHomeViewFromContactView {
    [self animateView:self.homeViewController.view currentView:self.contactViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showNowsView {
    [self getNews];
}

- (void)returnToHomeViewFromNewsView {
    [self animateView:self.homeViewController.view currentView:self.newsViewController.view animationDirection:@"right" hideCurrentView:YES animationDuration:0.3];
}

- (void)showExpressCreditView {
    
}

- (void)showInsurancesComparatorView {
    
}

- (void)getBarometerValues {
    
    if ([self connected]) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeAnnularDeterminate;
        self.hud.label.text = @"Récupération des taux...";
        
        NSError *error = nil;
        NSURL *url = [NSURL URLWithString:@"https://www.immofinances.net//taux/taux_immofinances.html"];
        NSData *htmlData = [NSData dataWithContentsOfURL:url];
        if (htmlData != nil) {
            [self.hud hideAnimated:YES];
            NSString *myString = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
            NSLog(@"myString %@", myString);
            
            //    Note that JSONObjectWithData will return either an NSDictionary or an NSArray, depending whether your JSON string represents an a dictionary or an array.
            id jsonObject = [NSJSONSerialization JSONObjectWithData:htmlData options:0 error:&error];
            
            if (error) {
                NSLog(@"Error parsing JSON: %@", error);
            }
            else
            {
                if ([jsonObject isKindOfClass:[NSArray class]])
                {
                    NSLog(@"it is an array!");
                    NSArray *jsonArray = (NSArray *)jsonObject;
                    NSLog(@"jsonArray - %@",jsonArray);
                }
                else {
                    NSLog(@"it is a dictionary");
                    NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                    NSLog(@"jsonDictionary - %@", jsonDictionary);
                    NSLog(@"taux_immofinances - %@", [jsonDictionary objectForKey:@"taux_immofinances"]);
                    
                    self.barometerViewController = [[BarometerViewController alloc] initWithNibName:@"BarometerView" bundle:nil];
                    self.barometerViewController.values = [jsonDictionary objectForKey:@"taux_immofinances"];
                    self.barometerViewController.delegate = self;
                    self.barometerViewController.view.frame = self.view.bounds;
                    [self animateView:self.barometerViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
                    
                }
            }
        } else {
            [self.hud hideAnimated:YES];
            [self showAlert:@"Erreur" message:@"Une erreur est survenue. Veuillez réessayer plus tard."];
        }
    } else {
        [self showAlert:@"Erreur" message:@"Impossible d'accéder au service. Veuillez vérifier votre connexion Internet."];
    }
    
    
}

- (void)getMeteoValues {
    
    if ([self connected]) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeAnnularDeterminate;
        self.hud.label.text = @"Récupération des taux...";
        
        NSError *error = nil;
        NSURL *url = [NSURL URLWithString:@"https://www.immofinances.net/taux/taux_immofinances_moyens.html"];
        NSData *htmlData = [NSData dataWithContentsOfURL:url];
        if (htmlData != nil) {
            [self.hud hideAnimated:YES];
            NSString *myString = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
            NSLog(@"myString %@", myString);
            
            //    Note that JSONObjectWithData will return either an NSDictionary or an NSArray, depending whether your JSON string represents an a dictionary or an array.
            id jsonObject = [NSJSONSerialization JSONObjectWithData:htmlData options:0 error:&error];
            
            if (error) {
                NSLog(@"Error parsing JSON: %@", error);
            }
            else
            {
                if ([jsonObject isKindOfClass:[NSArray class]])
                {
                    NSLog(@"it is an array!");
                    NSArray *jsonArray = (NSArray *)jsonObject;
                    NSLog(@"jsonArray - %@",jsonArray);
                }
                else {
                    NSLog(@"it is a dictionary");
                    NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                    NSLog(@"jsonDictionary - %@", jsonDictionary);
                    NSLog(@"taux_immofinances - %@", [jsonDictionary objectForKey:@"tab_franchiseur"]);
                    
                    self.rateDetailsViewController = [[RateDetailsViewController alloc] initWithNibName:@"RateDetailsView" bundle:nil];
                    self.rateDetailsViewController.hightValues = [jsonDictionary objectForKey:@"tab_franchiseur"];
                    self.rateDetailsViewController.averageValues = [jsonDictionary objectForKey:@"tab_franchises_moyen"];
                    self.rateDetailsViewController.lowValues = [jsonDictionary objectForKey:@"tab_franchises_bas"];
                    self.rateDetailsViewController.lowRegionsValues = [jsonDictionary objectForKey:@"tab_franchises_bas_region"];
                    self.rateDetailsViewController.delegate = self;
                    self.rateDetailsViewController.view.frame = self.view.bounds;
                    [self animateView:self.rateDetailsViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
                    
                }
            }
        } else {
            [self.hud hideAnimated:YES];
            [self showAlert:@"Erreur" message:@"Une erreur est survenue. Veuillez réessayer plus tard."];
        }
    } else {
        [self showAlert:@"Erreur" message:@"Impossible d'accéder au service. Veuillez vérifier votre connexion Internet."];
    }
    
    
}

- (void)getNews {
    if ([self connected]) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.mode = MBProgressHUDModeAnnularDeterminate;
        self.hud.label.text = @"Récupération des actualités...";
        NSString *key = @"746852426f76f0dbbd0cbb6a66dba64a";
        NSString *url = [NSString stringWithFormat:@"%@", @"https://immofinances.net/rest-api/v1/rss"];
        NSLog(@"url %@", url);
        [self getNewsRequest:url];
    } else {
        [self showAlert:@"Erreur" message:@"Impossible d'accéder au service. Veuillez vérifier votre connexion Internet."];
    }
}

- (void)getNewsRequest:(NSString*)url {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:url]];
    NSString *key = @"746852426f76f0dbbd0cbb6a66dba64a";
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:key, @"Authorization", nil];
    
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
        NSLog(@"response = %@", responseObject);
        [self.hud hideAnimated:YES];
        self.newsViewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSArray *responseArray = responseObject;
            /* do something with responseArray */
        } else if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *responseDict = responseObject;
            NSArray *jsonArray = (NSArray *)[responseDict objectForKey:@"result"];
            NSLog(@"jsonArray - %@",jsonArray);
            
            NSMutableArray *newsMovies = [[NSMutableArray alloc] init];
            for (int i = 0; i < [jsonArray count]; i++) {
                News *news = [[News alloc] init];
                NSDictionary *newsDic = jsonArray[0];
                news.newsTitle = [newsDic objectForKey:@"title"];
                news.newsDescription = [newsDic objectForKey:@"description"];
                news.newsDate = [newsDic objectForKey:@"DateAjout"];
                news.newsLink = [newsDic objectForKey:@"link"];
                [newsMovies addObject:news];
            }
            
            self.newsViewController.newsMovies = newsMovies;
            self.newsViewController.delegate = self;
            self.newsViewController.view.frame = self.view.bounds;
            [self animateView:self.newsViewController.view currentView:self.homeViewController.view animationDirection:@"left" hideCurrentView:NO animationDuration:0.3];
        }
        
        /*NSString *jsonData = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData *json = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;*/

        //    Note that JSONObjectWithData will return either an NSDictionary or an NSArray, depending whether your JSON string represents an a dictionary or an array.
        
        /*id jsonObject = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];

        if (error) {
            NSLog(@"Error parsing JSON: %@", error);
        }
        else
        {
            if ([jsonObject isKindOfClass:[NSArray class]])
            {
                NSLog(@"it is an array!");
                NSArray *jsonArray = (NSArray *)jsonObject;
                NSLog(@"jsonArray - %@",jsonArray);
            }
            else {
                NSLog(@"it is a dictionary");
                NSDictionary *jsonDictionary = (NSDictionary *)jsonObject;
                NSLog(@"jsonDictionary - %@",jsonDictionary);
            }
        }*/

        
        /*NSData *jsonData = [responseObject dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        self.newsViewController.newsMovies = [dictionary objectForKey:@"result"];
        NSLog(@"response = %@", [dictionary objectForKey:@"result"]);*/
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
        [self.hud hideAnimated:YES];
    }];
}

/*- (BOOL)connected {
    return [AFNetworkReachabilityManager sharedManager].reachable;
}*/

- (BOOL)connected {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    if ([reach isReachable]) {
        NSLog(@"Device is connected to the internet");
        return TRUE;
    }
    else {
        NSLog(@"Device is not connected to the internet");
        return FALSE;
    }
}

- (void)showAlert:(NSString*)title message:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)animateView:(UIView* )viewToShow currentView:(UIView* )currentView animationDirection:(NSString* )animationDirection hideCurrentView:(BOOL)hideCurrentView animationDuration:(double)animationDuration {
    float height = [[UIScreen mainScreen] bounds].size.height;
    float width = [[UIScreen mainScreen] bounds].size.width;
    CGRect rightPositionRect;
    CGRect leftPositionRect;
    
    if ([UIScreen mainScreen].bounds.size.width == 414.00){
        NSLog(@"iPhone 6 Plus");
        width = 375.00;
        height = 667.00;
    }
    
    if ([animationDirection isEqualToString:@"left"]) {
        rightPositionRect = CGRectMake(0, 0, width, height);
        leftPositionRect = CGRectMake(width, 0, width, height);
    }
    else {
        rightPositionRect = CGRectMake(width, 0, width, height);
        leftPositionRect = CGRectMake(0, 0, width, height);
    }
    
    [self.view addSubview:viewToShow];
    if ([animationDirection isEqualToString:@"left"]) {
        [viewToShow setFrame:leftPositionRect];
        [UIView animateWithDuration:0.3f animations:^{
            [viewToShow setFrame:rightPositionRect];
        } completion:^(BOOL finished) {
            if (hideCurrentView) {
                [currentView removeFromSuperview];
            }
        }];
    }
    else {
        [self.view addSubview:currentView];
        [currentView setFrame:leftPositionRect];
        [UIView animateWithDuration:0.3f animations:^{
            [currentView setFrame:rightPositionRect];
        } completion:^(BOOL finished) {
            if (hideCurrentView) {
                [currentView removeFromSuperview];
            }
        }];
    }
}

@end
