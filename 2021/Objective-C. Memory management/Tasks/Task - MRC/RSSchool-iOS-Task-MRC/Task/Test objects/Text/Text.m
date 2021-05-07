//
//  Text.m
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "Text.h"

@implementation Text

- (instancetype)initWithContent:(NSString *)content
{
    self = [super init];
    if (self) {
        _content = content;
    }
    return self;
}

+ (instancetype)textWithContent:(NSString *)content
{
    //NSLog(@"Doc content1: %lu", content.retainCount);
    return [[[Text alloc] initWithContent: content] autorelease];
}
-(void)dealloc{
    //[_content release];
    [super dealloc];
}
@end
