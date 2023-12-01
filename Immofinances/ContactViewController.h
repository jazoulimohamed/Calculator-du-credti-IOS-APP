//
//  ContactViewController.h
//  Immofinances
//
//  Created by Aminowizc on 27/08/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactViewControllerDelegate
@optional
- (void)returnToHomeViewFromContactView;
@end

@interface ContactViewController : UIViewController

@property (nonatomic, weak) id <ContactViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
