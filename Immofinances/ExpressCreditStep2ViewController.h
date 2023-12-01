//
//  ExpressCreditStep2ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ExpressCreditStep2ViewControllerDelegate
@optional
- (void)goToExpressCreditStep3View;
- (void)returnToExpressCreditStep1View;
@end

@interface ExpressCreditStep2ViewController : UIViewController

@property (nonatomic, weak) id <ExpressCreditStep2ViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
