//
//  Page.h
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printable.h"

@class Text, Document;

NS_ASSUME_NONNULL_BEGIN

@interface Page : NSObject<Printable>

@property (nonatomic, retain) Text *text;
@property (nonatomic, assign) Text *hiddenText;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, assign) Document *document;

+ (instancetype)pageWithText:(Text *)text;

@end

NS_ASSUME_NONNULL_END
