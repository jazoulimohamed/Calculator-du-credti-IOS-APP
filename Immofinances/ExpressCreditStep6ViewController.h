//
//  ExpressCreditStep6ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 24/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ExpressCreditStep6ViewControllerDelegate
@optional
- (void)returnToExpressCreditStep5View;
@end

@interface ExpressCreditStep6ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, weak) id <ExpressCreditStep6ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
