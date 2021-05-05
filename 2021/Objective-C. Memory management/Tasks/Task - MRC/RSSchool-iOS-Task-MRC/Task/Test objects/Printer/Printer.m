//
//  Printer.m
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import "Printer.h"

@implementation Printer

- (void)printObject:(NSObject<Printable> *)object {
    NSString *content  = [object content];
    NSLog(@"Printing result:\n%@", content);
}

@end
