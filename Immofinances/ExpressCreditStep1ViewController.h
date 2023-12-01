//
//  ExpressCreditStep1ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ExpressCreditStep1ViewControllerDelegate
@optional
- (void)goToExpressCreditStep2View;
- (void)returnToHomeViewFromExpressCreditStep1View;
@end

@interface ExpressCreditStep1ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <ExpressCreditStep1ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
