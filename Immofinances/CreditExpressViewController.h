//
//  CreditExpressViewController.h
//  Immofinances
//
//  Created by Aminowizc on 06/11/2020.
//  Copyright © 2020 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CreditExpressViewControllerDelegate
@optional
- (void)returnToHomeViewFromCreditExpressView;
@end

@interface CreditExpressViewController : UIViewController <WKNavigationDelegate>

@property (nonatomic, weak) id <CreditExpressViewControllerDelegate> delegate;
@property(strong,nonatomic) WKWebView *theWebView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;

@end

NS_ASSUME_NONNULL_END
