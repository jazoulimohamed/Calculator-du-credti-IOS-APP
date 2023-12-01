//
//  InsurancesComparatorStep4ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 20/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol InsurancesComparatorStep4ViewControllerDelegate
@optional
- (void)returnToInsurancesComparatorStep3View;
@end

@interface InsurancesComparatorStep4ViewController : UIViewController

@property (nonatomic, weak) id <InsurancesComparatorStep4ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
