//
//  NewsCustomTableViewCell.h
//  Immofinances
//
//  Created by Aminowizc on 29/12/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsCustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@property (weak, nonatomic) IBOutlet UILabel *newsDescription;
@property (weak, nonatomic) IBOutlet UILabel *newsDate;

@end

NS_ASSUME_NONNULL_END
