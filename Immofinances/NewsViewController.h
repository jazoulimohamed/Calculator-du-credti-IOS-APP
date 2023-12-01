//
//  NewsViewController.h
//  Immofinances
//
//  Created by Aminowizc on 29/12/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NewsViewControllerDelegate
@optional
- (void)returnToHomeViewFromNewsView;
@end

@interface NewsViewController : UIViewController

@property (nonatomic, weak) id <NewsViewControllerDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *newsMovies;

@end

NS_ASSUME_NONNULL_END
