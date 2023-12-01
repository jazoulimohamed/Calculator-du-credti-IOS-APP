//
//  SlideMenuViewController.h
//  AlTareekh
//
//  Created by Aminowizc on 16/09/2016.
//  Copyright © 2016 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleListCell.h"

@protocol SlideMenuViewControllerDelegate
@optional
- (void)showView:(NSInteger)index;
@end

@interface SlideMenuViewController : UIViewController

@property (nonatomic, weak) id <SlideMenuViewControllerDelegate> delegate;

@end
