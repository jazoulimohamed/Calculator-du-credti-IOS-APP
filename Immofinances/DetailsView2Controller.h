//
//  DetailsView2ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsView2ControllerDelegate
@optional
- (void)hideDetailsView2;
@end

@interface DetailsView2Controller : UIViewController

@property (nonatomic, weak) id <DetailsView2ControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
