//
//  Page.m
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "Page.h"
#import "Text.h"

@implementation Page

- (instancetype)initWithText:(Text *)text {
    self = [super init];
    if (self) {
        _text = text;
    }
    return self;
}

+ (instancetype)pageWithText:(Text *)text {
    return [[Page alloc] initWithText:text];
}

- (NSString *)content {
    NSString *content = [NSString stringWithFormat:@"Page %lu: %@", self.number, self.text.content];

    if (self.hiddenText.content) {
        content = [content stringByAppendingFormat:@"\nHidden text: %@", self.hiddenText.content];
    }

    return content;
}

- (void)setDocument:(Document *)document {
    [document retain];
    [_document release];
    _document = document;
}

@end
