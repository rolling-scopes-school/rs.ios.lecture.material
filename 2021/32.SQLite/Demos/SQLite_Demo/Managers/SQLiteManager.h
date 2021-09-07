//
//  SQLiteManager.h
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSStudent;
@class RSMentor;

@interface SQLiteManager : NSObject

+ (instancetype)sharedInstance;
- (NSArray<RSStudent *> *)students;
- (BOOL)createDataBaseIfNeeded;
- (RSStudent *)addStudent:(RSStudent *)student;
- (RSStudent *)updateStudent:(RSStudent *)student;
- (BOOL)deleteStudent:(RSStudent *)student;

@end
