//
//  RSStudentFormViewController.h
//  SQLite_Demo
//
//  Created by Victor Semenchuk on 6/24/20.
//  Copyright © 2020 Victor Semenchuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSStudent;

@interface RSStudentFormViewController : UIViewController

- (instancetype)initWithStudent:(RSStudent *)student completion:(void(^)(RSStudent *))completion;

@end
