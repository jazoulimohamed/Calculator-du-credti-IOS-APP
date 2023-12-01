//
//  News.h
//  Immofinances
//
//  Created by Aminowizc on 29/12/2018.
//  Copyright © 2018 Aminowizc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface News : NSObject

@property (strong, nonatomic) NSString *newsTitle;
@property (strong, nonatomic) NSString *newsDescription;
@property (strong, nonatomic) NSString *newsDate;
@property (strong, nonatomic) NSString *newsLink;

@end

NS_ASSUME_NONNULL_END
