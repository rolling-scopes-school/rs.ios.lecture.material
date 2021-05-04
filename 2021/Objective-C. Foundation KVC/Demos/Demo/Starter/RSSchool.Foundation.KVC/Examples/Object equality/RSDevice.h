//
//  RSDevice.h
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 28.04.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSDevice : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *capacity;
- (instancetype)initWithName:(NSString *)name capacity:(NSNumber *)capacity;
@end

NS_ASSUME_NONNULL_END
