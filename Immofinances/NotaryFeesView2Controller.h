//
//  NotaryFeesView2Controller.h
//  Immofinances
//
//  Created by Aminowizc on 13/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NotaryFeesView2ControllerDelegate
@optional
- (void)showPickerView1;
- (void)estimateTotalValue;
@end

@interface NotaryFeesView2Controller : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UISlider *slider1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UISlider *slider2;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField1;
@property (weak, nonatomic) IBOutlet UITextField *totalTextField2;

@property (nonatomic, weak) id <NotaryFeesView2ControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *buttonPicker;

@end

NS_ASSUME_NONNULL_END
