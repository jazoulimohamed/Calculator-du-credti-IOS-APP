//
//  NotaryFeesViewController.h
//  Immofinances
//
//  Created by Aminowizc on 13/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotaryFeesView1Controller.h"
#import "NotaryFeesView2Controller.h"
#import "NotaryFeesView3Controller.h"
#import "NotaryFeesView4Controller.h"
#import "NotaryFeesView5Controller.h"
#import "S.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NotaryFeesViewControllerDelegate
@optional
- (void)returnToHomeViewFromNotaryFeesView;
@end

@interface NotaryFeesViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, NotaryFeesView1ControllerDelegate, NotaryFeesView2ControllerDelegate, NotaryFeesView3ControllerDelegate,
    NotaryFeesView4ControllerDelegate,
    NotaryFeesView5ControllerDelegate>

@property (nonatomic, weak) id <NotaryFeesViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
