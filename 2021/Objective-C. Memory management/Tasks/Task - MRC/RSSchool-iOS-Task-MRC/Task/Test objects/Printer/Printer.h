//
//  Printer.h
//  RSSchool-iOS-Task-MRC
//
//  Created by Aliaksei Piatyha on 4/30/21.
//  Copyright © 2021 Alexei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printable.h"

NS_ASSUME_NONNULL_BEGIN

@interface Printer : NSObject

- (void)printObject:(NSObject<Printable> *) object;

@end

NS_ASSUME_NONNULL_END
