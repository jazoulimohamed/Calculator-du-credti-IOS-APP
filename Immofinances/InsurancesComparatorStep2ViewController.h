//
//  InsurancesComparatorStep2ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 20/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsView2Controller.h"

NS_ASSUME_NONNULL_BEGIN

@protocol InsurancesComparatorStep2ViewControllerDelegate
@optional
- (void)goToInsurancesComparatorStep3View;
- (void)returnToInsurancesComparatorStep1View;
@end

@interface InsurancesComparatorStep2ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, DetailsView2ControllerDelegate>

@property (nonatomic, weak) id <InsurancesComparatorStep2ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
