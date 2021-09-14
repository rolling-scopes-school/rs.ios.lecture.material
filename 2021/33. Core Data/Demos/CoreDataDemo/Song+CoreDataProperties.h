//
//  Song+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by Vadim Nevyglas on 7/13/20.
//  Copyright © 2020 Vadim Nevyglas. All rights reserved.
//
//

#import "Song+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Song (CoreDataProperties)

+ (NSFetchRequest<Song *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *artist;
@property (nullable, nonatomic, copy) NSString *album;

@end

NS_ASSUME_NONNULL_END
