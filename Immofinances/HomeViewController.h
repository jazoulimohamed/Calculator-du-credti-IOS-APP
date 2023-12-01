//
//  HomeViewController.h
//  Immofinances
//
//  Created by Aminowizc on 14/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol HomeViewControllerDelegate
@optional
- (void)showRateDetailsView;
- (void)showMonthlyPaymentsView;
- (void)showBorrowingCapacityView;
- (void)showRepaymentDurationView;
- (void)showBarometerView;
- (void)showNotaryFeesView;
- (void)showExpressCreditStep1View;
- (void)showPersonalAreaView;
- (void)showInsurancesComparatorStep1View;
- (void)showContactView;
- (void)showNowsView;
@end

@interface HomeViewController : UIViewController <SlideMenuViewControllerDelegate>

@property (nonatomic, weak) id <HomeViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
