//
//  DetailsView1Controller.h
//  Immofinances
//
//  Created by Aminowizc on 21/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsView1ControllerDelegate
@optional
- (void)hideDetailsView1;
@end

@interface DetailsView1Controller : UIViewController

@property (nonatomic, weak) id <DetailsView1ControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
