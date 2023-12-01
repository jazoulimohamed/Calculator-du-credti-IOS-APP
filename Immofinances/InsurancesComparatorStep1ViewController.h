//
//  InsurancesComparatorStep1ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 20/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsView1Controller.h"

NS_ASSUME_NONNULL_BEGIN

@protocol InsurancesComparatorStep1ViewControllerDelegate
@optional
- (void)goToInsurancesComparatorStep2View;
- (void)returnToHomeViewFromInsurancesComparatorStep1View;
@end

@interface InsurancesComparatorStep1ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, DetailsView1ControllerDelegate>

@property (nonatomic, weak) id <InsurancesComparatorStep1ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
