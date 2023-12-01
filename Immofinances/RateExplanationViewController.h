//
//  RateExplanationViewController.h
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RateExplanationViewControllerDelegate
@optional
- (void)hideRateExplanationView;
@end

@interface RateExplanationViewController : UIViewController

@property (nonatomic, weak) id <RateExplanationViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
