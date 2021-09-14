//
//  Song+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by Vadim Nevyglas on 7/13/20.
//  Copyright © 2020 Vadim Nevyglas. All rights reserved.
//
//

#import "Song+CoreDataProperties.h"

@implementation Song (CoreDataProperties)

+ (NSFetchRequest<Song *> *)fetchRequest {
    NSFetchRequest<Song *> *request = [NSFetchRequest fetchRequestWithEntityName:@"Song"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    return request;
}

@dynamic name;
@dynamic artist;
@dynamic album;

@end
