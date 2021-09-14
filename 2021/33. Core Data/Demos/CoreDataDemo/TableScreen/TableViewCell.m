//
//  TableViewCell.m
//  CoreDataDemo
//
//  Created by Vadim Nevyglas on 7/12/20.
//  Copyright © 2020 Vadim Nevyglas. All rights reserved.
//

#import "TableViewCell.h"

const NSString *kSongNameCell = @"song";
const NSString *kArtistCell = @"artist";
const NSString *kAlbumCell = @"album";

@implementation TableViewCell

- (void)configureWithSong:(Song *)song {
    self.artistLabel.text = song.artist;
    self.songLabel.text = song.name;
}

- (NSString *)reuseIdentifier {
    return @"TableViewCell";
}

@end
