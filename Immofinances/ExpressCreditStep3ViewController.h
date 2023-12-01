//
//  ExpressCreditStep3ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 28/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ExpressCreditStep3ViewControllerDelegate
@optional
- (void)goToExpressCreditStep4View;
- (void)returnToExpressCreditStep2View;
@end

@interface ExpressCreditStep3ViewController : UIViewController

@property (nonatomic, weak) id <ExpressCreditStep3ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
