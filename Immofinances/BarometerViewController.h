//
//  BarometerViewController.h
//  Immofinances
//
//  Created by Aminowizc on 08/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BarometerViewControllerDelegate
@optional
- (void)returnToHomeViewFromBarometerView;
@end

@interface BarometerViewController : UIViewController

@property (nonatomic, weak) id <BarometerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSDictionary *values;

@end

NS_ASSUME_NONNULL_END
