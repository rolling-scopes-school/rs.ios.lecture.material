//
//  Address.h
//  RSSchool.Foundation.KVC
//
//  Created by Diana Tynkovan on 2.05.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Address : NSObject
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *street;
@end

NS_ASSUME_NONNULL_END
