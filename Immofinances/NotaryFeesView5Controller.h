//
//  NotaryFees5ViewController.h
//  Immofinances
//
//  Created by Aminowizc on 13/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NotaryFeesView5ControllerDelegate
@optional
- (void)estimateTotalValue;
@end

@interface NotaryFeesView5Controller : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UISlider *slider2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;
@property (weak, nonatomic) IBOutlet UISlider *slider3;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField1;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField2;
@property (nonatomic, weak) id <NotaryFeesView5ControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
