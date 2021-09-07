//
//  RSScoreTableViewCell.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import "RSScoreTableViewCell.h"
#import "RSProgressView.h"

@interface RSScoreTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *studentIdLabel;
@property (weak, nonatomic) IBOutlet UILabel *studentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet RSProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *mentorNameLabel;

@end

@implementation RSScoreTableViewCell

- (void)confgureWithStudent:(RSStudent *)student {
    self.studentIdLabel.text = [NSString stringWithFormat:@"%ld", student.studentId];
    self.studentNameLabel.text = [NSString stringWithFormat:@"%@ %@", student.firstName, student.lastName];
    self.locationLabel.text = student.location;
    self.progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)(student.progress * 100)];
    [self.progressView setProgress:student.progress];
    self.mentorNameLabel.text = [NSString stringWithFormat:@"%@ %@", student.mentor.firstName, student.mentor.lastName];
}

@end
