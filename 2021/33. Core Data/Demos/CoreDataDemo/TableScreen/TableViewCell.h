//
//  TableViewCell.h
//  CoreDataDemo
//
//  Created by Vadim Nevyglas on 7/12/20.
//  Copyright © 2020 Vadim Nevyglas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *songLabel;

- (void)configureWithSong:(NSDictionary *)song;

@end

NS_ASSUME_NONNULL_END
