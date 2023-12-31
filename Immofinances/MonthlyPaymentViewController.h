//
//  MonthlyPaymentViewController.h
//  Immofinances
//
//  Created by Aminowizc on 06/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MonthlyPaymentViewControllerDelegate
@optional
- (void)returnToHomeViewFromMonthlyPaymentView;
@end

@interface MonthlyPaymentViewController : UIViewController

@property (nonatomic, weak) id <MonthlyPaymentViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
