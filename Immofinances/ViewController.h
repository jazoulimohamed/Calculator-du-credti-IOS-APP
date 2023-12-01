//
//  ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 06/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "RateDetailsViewController.h"
#import "MonthlyPaymentViewController.h"
#import "BorrowingCapacityViewController.h"
#import "RepaymentPeriodViewController.h"
#import "BarometerViewController.h"
#import "NotaryFeesViewController.h"
#import "InsurancesComparatorStep1ViewController.h"
#import "InsurancesComparatorStep2ViewController.h"
#import "InsurancesComparatorStep3ViewController.h"
#import "InsurancesComparatorStep4ViewController.h"
#import "ExpressCreditStep1ViewController.h"
#import "ExpressCreditStep2ViewController.h"
#import "ExpressCreditStep3ViewController.h"
#import "ExpressCreditStep4ViewController.h"
#import "ExpressCreditStep5ViewController.h"
#import "ExpressCreditStep6ViewController.h"
#import "PersonalAreaViewController.h"
#import "ContactViewController.h"
#import "NewsViewController.h"
#import "CreditExpressViewController.h"
#import "InsuranceComparatorViewController.h"

@interface ViewController : UIViewController <HomeViewControllerDelegate, MonthlyPaymentViewControllerDelegate, RateDetailsViewControllerDelegate, BorrowingCapacityViewControllerDelegate, RepaymentPeriodViewControllerDelegate, BarometerViewControllerDelegate, NotaryFeesViewControllerDelegate, InsurancesComparatorStep1ViewControllerDelegate, InsurancesComparatorStep2ViewControllerDelegate, InsurancesComparatorStep3ViewControllerDelegate, InsurancesComparatorStep4ViewControllerDelegate, PersonalAreaViewControllerDelegate, ContactViewControllerDelegate, ExpressCreditStep1ViewControllerDelegate, ExpressCreditStep2ViewControllerDelegate, ExpressCreditStep3ViewControllerDelegate, ExpressCreditStep4ViewControllerDelegate, ExpressCreditStep5ViewControllerDelegate, ExpressCreditStep6ViewControllerDelegate,
    NewsViewControllerDelegate, CreditExpressViewControllerDelegate, InsuranceComparatorViewControllerDelegate>

@end

