//
//  PersonalAreaViewController.h
//  Immofinances
//
//  Created by Aminowizc on 27/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol InsuranceComparatorViewControllerDelegate
@optional
- (void)returnToHomeViewFromInsuranceComparatorView;
@end

@interface InsuranceComparatorViewController : UIViewController <WKNavigationDelegate>

@property (nonatomic, weak) id <InsuranceComparatorViewControllerDelegate> delegate;
@property(strong,nonatomic) WKWebView *theWebView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;

@end

NS_ASSUME_NONNULL_END
