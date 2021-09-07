//
//  SQLiteManager.m
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <sqlite3.h>
#import "SQLiteManager.h"
#import "RSStudent.h"

static NSString * const kDatabaseFilename = @"RSSchool.sqlite";

@interface SQLiteManager ()

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSMutableArray<RSStudent *> *results;

@end

@implementation SQLiteManager

+ (instancetype)sharedInstance {
    static SQLiteManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SQLiteManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.documentsDirectory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    }
    return self;
}

#pragma mark - Public methods

- (NSArray<RSStudent *> *)students {
    NSString *query = @"SELECT * FROM students JOIN mentors ON students.mentorId = mentors.id";
    [self runQuery:query];
    NSArray<RSStudent *> *results = [self.results copy];
    self.results = nil;
    return results;
    return @[];
}

- (BOOL)createDataBaseIfNeeded {
    NSString *databasePath = [self.documentsDirectory stringByAppendingPathComponent:kDatabaseFilename];
    NSFileManager *fileManager = [NSFileManager new];
    NSLog(@"Database destination path: %@", databasePath);

    if ([fileManager fileExistsAtPath:databasePath]) {
        return YES;
    }

    sqlite3 *database;
    if (sqlite3_open([databasePath UTF8String], &database) != SQLITE_OK) {
        return NO;
    }

    NSString *query = @"CREATE TABLE students (id integer PRIMARY KEY, firstName text NOT NULL, lastName text NOT NULL, location text NOT NULL, progress real NOT NULL, mentorId integer)";
    [self runQuery:query];

    query = @"CREATE TABLE mentors (id integer PRIMARY KEY, firstName text NOT NULL, lastName text NOT NULL)";
    BOOL result = [self runQuery:query];

    sqlite3_close(database);

    if (result) {
        [self fillInitialData];
    }

    return result;
    return NO;
}

- (RSStudent *)addStudent:(RSStudent *)student {
    NSString *query = [NSString
                       stringWithFormat:@"INSERT INTO students (firstName, lastName, location, progress, mentorId) VALUES ('%@', '%@', '%@', %f, %lu)",
                       student.firstName,
                       student.lastName,
                       student.location,
                       student.progress,
                       student.mentor.mentorId];
    if ([self runQuery:query]) {
        return [self lastStudent];
    } else {
        return nil;
    }
    return nil;
}

- (BOOL)deleteStudent:(RSStudent *)student {
    NSString *query = [NSString stringWithFormat:@"DELETE FROM students WHERE id = %lu", student.studentId];
    return [self runQuery:query];
    return NO;
}

- (RSStudent *)updateStudent:(RSStudent *)student {
    NSString *query = [NSString
                       stringWithFormat:@"UPDATE students SET firstName = '%@', lastName = '%@', location = '%@', progress = %f, mentorId = %lu WHERE id = %lu",
                       student.firstName,
                       student.lastName,
                       student.location,
                       student.progress,
                       student.mentor.mentorId,
                       student.studentId];
    if ([self runQuery:query]) {
        return [self studentWithId:student.studentId];
    } else {
        return nil;
    }
    return nil;
}

- (RSStudent *)lastStudent {
    NSString *query = @"SELECT * FROM students JOIN mentors ON students.mentorId = mentors.id ORDER BY id DESC LIMIT 1";
    if ([self runQuery:query]) {
        return self.results.firstObject;
    } else {
        return nil;
    }
    return nil;
}

- (RSStudent *)studentWithId:(NSUInteger)studentId {
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM students JOIN mentors ON students.mentorId = mentors.id WHERE students.id = %lu", studentId];
    if ([self runQuery:query]) {
        return self.results.firstObject;
    } else {
        return nil;
    }
    return nil;
}

#pragma mark - Private methods

- (BOOL)runQuery:(NSString *)query {
    sqlite3 *database = NULL;
    int resultCode = SQLITE_OK;
    NSString *databasePath = [self.documentsDirectory stringByAppendingPathComponent:kDatabaseFilename];

    resultCode = sqlite3_open([databasePath UTF8String], &database);
    if (resultCode != SQLITE_OK) {
        NSLog(@"Database opening error: %s", sqlite3_errmsg(database));
        sqlite3_close(database);
        return NO;
    }

    sqlite3_stmt *compiledStatement;
    resultCode = sqlite3_prepare_v2(database, [query UTF8String], -1, &compiledStatement, NULL);
    if (resultCode != SQLITE_OK) {
        NSLog(@"Error: %s", sqlite3_errmsg(database));
        sqlite3_finalize(compiledStatement);
        sqlite3_close(database);
        return NO;;
    }

    [self runExecutableQuery:compiledStatement];

    sqlite3_finalize(compiledStatement);
    sqlite3_close(database);

    return YES;

    return NO;
}

- (NSUInteger)runExecutableQuery:(sqlite3_stmt *)statement {
    self.results = [NSMutableArray new];
    while (sqlite3_step(statement) == SQLITE_ROW) {
        NSUInteger studentId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)] integerValue];
        NSString *firstName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
        NSString *lastName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
        NSString *location = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
        double progress = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)] doubleValue];
        NSUInteger mentorId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)] integerValue];
        NSString *mentorFirstName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 7)];
        NSString *mentorLastName = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 8)];

        RSMentor *mentor = [[RSMentor alloc] initWithId:mentorId
                                              firstName:mentorFirstName
                                               lastName:mentorLastName];
        RSStudent *student = [[RSStudent alloc] initWithId:studentId
                                                 firstName:firstName
                                                  lastName:lastName
                                                  location:location
                                                  progress:progress
                                                    mentor:mentor];

        [self.results addObject:student];
    };

    return SQLITE_OK;
}

- (void)fillInitialData {
//    NSString *query = [NSString stringWithFormat:@"INSERT INTO mentors (firstName, lastName) VALUES ('%@', '%@')", @"Craig", @"Federighi"];
//    [self runQuery:query];
//
//    query = [NSString stringWithFormat:@"INSERT INTO mentors (firstName, lastName) VALUES ('%@', '%@')", @"Jony", @"Ive"];
//    [self runQuery:query];
//
//    query = [NSString stringWithFormat:@"INSERT INTO mentors (firstName, lastName) VALUES ('%@', '%@')", @"Matt", @"Galloway"];
//    [self runQuery:query];
}

@end
