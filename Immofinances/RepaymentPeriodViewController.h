//
//  RepaymentPeriodViewController.h
//  Immofinances
//
//  Created by Aminowizc on 07/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RepaymentPeriodViewControllerDelegate
@optional
- (void)returnToHomeViewFromRepaymentPeriodView;
@end

@interface RepaymentPeriodViewController : UIViewController

@property (nonatomic, weak) id <RepaymentPeriodViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
