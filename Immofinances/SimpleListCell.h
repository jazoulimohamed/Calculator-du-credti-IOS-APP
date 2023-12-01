//
//  SimpleListCell.h
//  AlTareekh
//
//  Created by Aminowizc on 30/01/2017.
//  Copyright © 2017 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *menuTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UIView *separatorView;

@end
