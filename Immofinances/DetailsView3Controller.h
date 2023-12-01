//
//  DetailsView3Controller.h
//  Immofinances
//
//  Created by Aminowizc on 27/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsView3ControllerDelegate
@optional
- (void)hideDetailsView3;
@end

@interface DetailsView3Controller : UIViewController

@property (nonatomic, weak) id <DetailsView3ControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
