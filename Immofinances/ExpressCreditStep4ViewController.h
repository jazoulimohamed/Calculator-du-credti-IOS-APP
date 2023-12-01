//
//  ExpressCreditView4Controller.h
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ExpressCreditStep4ViewControllerDelegate
@optional
- (void)goToExpressCreditStep5View;
- (void)returnToExpressCreditStep3View;
@end

@interface ExpressCreditStep4ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (nonatomic, weak) id <ExpressCreditStep4ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
