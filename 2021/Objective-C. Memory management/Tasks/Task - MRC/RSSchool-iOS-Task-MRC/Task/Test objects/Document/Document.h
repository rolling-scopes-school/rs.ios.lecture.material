//
//  Document.h
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printable.h"

@class Page, Text;

NS_ASSUME_NONNULL_BEGIN

@interface Document : NSObject<Printable>

@property (nonatomic, retain) NSArray *pages;
//@property (nonatomic, assign) NSArray *pages;
@property (nonatomic, retain) Text *title;
//@property (nonatomic, assign) Text *title;
- (instancetype)initWithTitle:(Text *)title;
- (void)addPage:(Page *)page;

@end

NS_ASSUME_NONNULL_END
