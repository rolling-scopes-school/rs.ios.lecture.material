//
//  Objective-C Fundamentals 
//  ----------🪄✨----------
//  

#import <Foundation/Foundation.h>
#import "RSPortEnterable.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSPassenger : NSObject <RSPortEnterable>

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (void)sayHello;

@end

NS_ASSUME_NONNULL_END
