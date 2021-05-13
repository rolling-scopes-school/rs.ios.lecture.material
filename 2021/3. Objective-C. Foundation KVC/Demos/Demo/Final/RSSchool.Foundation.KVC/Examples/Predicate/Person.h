//
//  Person.h
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 2.05.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Address;

@interface Person : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, strong) Address *address;
@property (nonatomic, strong) NSNumber *cash;
- (instancetype)initWithFirstName:(NSString *)firstName;
@end

NS_ASSUME_NONNULL_END
