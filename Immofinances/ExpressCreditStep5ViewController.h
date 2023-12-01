//
//  ExpressCreditStep5ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ExpressCreditStep5ViewControllerDelegate
@optional
- (void)goToExpressCreditStep6View;
- (void)returnToExpressCreditStep4View;
@end

@interface ExpressCreditStep5ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <ExpressCreditStep5ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
