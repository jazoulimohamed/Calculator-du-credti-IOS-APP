//
//  BorrowingCapacityViewController.h
//  Immofinances
//
//  Created by Aminowizc on 07/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BorrowingCapacityViewControllerDelegate
@optional
- (void)returnToHomeViewFromBorrowingCapacityView;
@end

@interface BorrowingCapacityViewController : UIViewController

@property (nonatomic, weak) id <BorrowingCapacityViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
