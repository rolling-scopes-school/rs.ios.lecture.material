//
//  RSPhotoCollectionViewCell.m
//  Demo2_Networking
//
//  Created by Victor Semenchuk on 6/20/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSPhotoCollectionViewCell.h"
#import "RSUser.h"

@interface RSPhotoCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *keySkillLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation RSPhotoCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.containerView.layer.cornerRadius = 10.0;
    self.containerView.clipsToBounds = YES;
}

- (void)configureWithItem:(RSUser *)user {
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.companyLabel.text = user.company;
    self.titleLabel.text = user.title;
    self.keySkillLabel.text = user.keySkill;
    self.photoImageView.image = user.image ? user.image : [UIImage imageNamed:@"Placeholder"];
}

@end
