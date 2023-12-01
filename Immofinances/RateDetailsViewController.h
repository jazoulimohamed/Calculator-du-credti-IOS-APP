//
//  RateDetailsViewController.h
//  Immofinances
//
//  Created by Aminowizc on 17/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateExplanationViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RateDetailsViewControllerDelegate
@optional
- (void)returnToHomeViewFromRateDetailsView;
@end

@interface RateDetailsViewController : UIViewController <RateExplanationViewControllerDelegate>

@property (nonatomic, weak) id <RateDetailsViewControllerDelegate> delegate;
@property (nonatomic, strong) NSDictionary *hightValues;
@property (nonatomic, strong) NSDictionary *averageValues;
@property (nonatomic, strong) NSDictionary *lowValues;
@property (nonatomic, strong) NSDictionary *lowRegionsValues;

@end

NS_ASSUME_NONNULL_END
