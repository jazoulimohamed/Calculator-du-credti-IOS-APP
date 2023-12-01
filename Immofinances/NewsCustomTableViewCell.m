//
//  NewsCustomTableViewCell.m
//  Immofinances
//
//  Created by Aminowizc on 29/12/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import "NewsCustomTableViewCell.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation NewsCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.newsTitle.textColor = UIColorFromRGB(0xFD8355);
    self.newsDate.textColor = UIColorFromRGB(0xCCCCCC);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
