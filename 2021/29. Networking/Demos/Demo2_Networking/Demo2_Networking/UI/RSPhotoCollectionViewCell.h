//
//  RSPhotoCollectionViewCell.h
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSUser;

@interface RSPhotoCollectionViewCell : UICollectionViewCell

- (void)configureWithItem:(RSUser *)user;

@end
