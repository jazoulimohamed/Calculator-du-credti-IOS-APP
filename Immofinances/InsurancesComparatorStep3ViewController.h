//
//  InsurancesComparatorStep3ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsView3Controller.h"

NS_ASSUME_NONNULL_BEGIN

@protocol InsurancesComparatorStep3ViewControllerDelegate
@optional
- (void)goToInsurancesComparatorStep4View;
- (void)returnToInsurancesComparatorStep2View;
@end

@interface InsurancesComparatorStep3ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, DetailsView3ControllerDelegate>

@property (nonatomic, weak) id <InsurancesComparatorStep3ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
