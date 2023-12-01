//
//  SimpleListCell.m
//  AlTareekh
//
//  Created by Aminowizc on 30/01/2017.
//  Copyright © 2017 Aminowizc. All rights reserved.
//

#import "SimpleListCell.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation SimpleListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.menuTitleLabel.textColor = UIColorFromRGB(0xffffff);
    self.menuTitleLabel.numberOfLines = 2;
    self.menuTitleLabel.textColor = [UIColor whiteColor];
    self.menuTitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.menuTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
