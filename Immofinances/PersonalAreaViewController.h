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

@protocol PersonalAreaViewControllerDelegate
@optional
- (void)returnToHomeViewFromPersonalAreaView;
@end

@interface PersonalAreaViewController : UIViewController <WKNavigationDelegate>

@property (nonatomic, weak) id <PersonalAreaViewControllerDelegate> delegate;
@property(strong,nonatomic) WKWebView *theWebView;
@property (weak, nonatomic) IBOutlet UIView *toolBar;

@end

NS_ASSUME_NONNULL_END
